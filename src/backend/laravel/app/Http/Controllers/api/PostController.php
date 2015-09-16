<?php

namespace App\Http\Controllers\Api;

use Validator;
use Input;
use URL;
use DB;
use App\MyClasses\MessageUtility;
use App\MyClasses\Utility;
use App\Post;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

class PostController extends ApiController
{
    /**
     * Get all posts in this blog.
     * URI: GET api/users
     *
     * @return Response
     */
    public function index(Request $request)
    {
		$posts = Post::select('posts.id','posts.title','posts.created_at','posts.updated_at','posts.author_id','posts.image',
                        DB::raw('CONCAT(users.first_name," ", users.last_name) As author_name')
                    )->leftJoin('users', function($join) {
						$join->on('users.id', '=','posts.author_id');
					})->where('posts.status',1)
                    ->get();

		if ($posts) {
			$postsArr = array();
			foreach ($posts as $post) {
				$postsArr[] = $post->toArray();
			}
			// Get all posts successfully
			$this->response = MessageUtility::getResponse(
				trans('api.CODE_INPUT_SUCCESS'),
				trans('api.DESCRIPTION_GET_SUCCESS'),
				trans('api.MSG_GET_SUCCESS',['attribute' => 'Posts']),
				$postsArr
			);

		}
        return response()->json($this->response);
    }

    /**
     * Get all posts of one user by user ID.
     * URI: GET api/users/{id}/posts
     *
     * @return Response
     */
    public function getUserPosts(Request $request, $author_id)
    {
        // Validate author id must be an integer
        if (!$this->validateInteger($author_id,'Author ID')) return response()->json($this->response);

        $user = User::where('id',$author_id)->first();
        if ($user) {
            $posts = Post::where('author_id', (int) $author_id)
                        ->where('status',1)->get();
            if ($posts) {
                $postsArr = array();
                foreach ($posts as $post) {
                    $postData = $post->toArray();
                    $postsArr[] = array(
                        'id'          => $postData['id'],
                        'title'       => $postData['title'],
                        'author_id'   => $postData['author_id'],
                        'author_name' => $user['first_name'] . ' '. $user['last_name'],
                        'image'       => $postData['image'],
                        'created_at'  => $postData['created_at'],
                        'updated_at'  => $postData['updated_at'],
                    );
                }
                // Get all user posts successfully
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_SUCCESS'),
                    trans('api.DESCRIPTION_GET_SUCCESS'),
                    trans('api.MSG_GET_USER_POST_SUCCESS',['attribute' => $user->id]),
                    $postsArr
                );
            }
        } else {
            // User not found
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_DB_NOT_FOUND'),
                trans('api.DESCRIPTION_DB_NOT_FOUND'),
                trans('api.MSG_DB_NOT_FOUND', ['attribute' => 'User'])
            );
        }

		return response()->json($this->response);
	}


    /**
     * Create new post
     * URI: POST /api/posts
     *
     * @param  Request  $request
     * @return Response
     */
    public function store(Request $request)
    {
        $validator = $this->validator($request->all(), $request->method());
        // Validation fails
        if ($validator->fails()) {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_FAILED'),
                trans('api.DESCRIPTION_INPUT_FAILED'),
                MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
            );

            return response()->json($this->response);
        } else {
            // Upload file
            $image = '';
            if (Input::file('image')) {
                $imageLink = $this->upload();
                $image = URL::to('/uploads/'. $imageLink);
            }
            // Validation success
            $post = Post::create([
                'author_id' => Auth::user()->id,
                'title'     => $request->input('title'),
                'content'   => $request->input('content'),
                'status'    => $request->input('status'),
                'image'     => $image

            ]);
            if ($post) {
                // Create post successfully
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_SUCCESS'),
                    trans('api.DESCRIPTION_CREATE_SUCCESS'),
                    trans('api.MSG_CREATE_SUCCESS',['attribute' => 'Post']),
                    $post->toArray()
                );
            } else {
                // Create post failed
                $this->dbError();
            }
        }

        return response()->json($this->response);
    }

    /**
     * Get all content of post.
     *
     * @param  int  $id
     * @return Response
     */
    public function show($id)
    {
        // Validate post id must be an integer
        if (!$this->validateInteger($id,'Post ID')) return response()->json($this->response);

        $post = Post::select('posts.*', DB::raw('CONCAT(users.first_name," ", users.last_name) As author_name') )
                    ->leftJoin('users', function($join) {
                        $join->on('users.id', '=','posts.author_id');
                    })->where('posts.id', $id)
                    ->where('posts.status',1)->first();
        if ($post) {
            // Get post info success
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_SUCCESS'),
                trans('api.DESCRIPTION_GET_INFO_SUCCESS'),
                trans('api.MSG_GET_INFO_SUCCESS', ['attribute' => 'Post']),
                $post->toArray()
            );
        } else {
            // Post not found
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_DB_NOT_FOUND'),
                trans('api.DESCRIPTION_DB_NOT_FOUND'),
                trans('api.MSG_DB_NOT_FOUND', ['attribute' => 'Post'])
            );
        }

        return response()->json($this->response);
    }


    /**
     * Update post by id.
     *
     * @param  Request  $request
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {

        // Validate author id must be an integer
        if (!$this->validateInteger($id,'Post ID')) return response()->json($this->response);

        // Check parameters have at least one field

        $post = new Post();
        $fieldsList = Utility::removeArrayElement($post->getFillable(), 'author_id');
        if (! Utility::checkArrayHaveKey($fieldsList, array_keys($request->all() ) ) ) {
            return $this->emptyData($fieldsList);
        }

        $validator = $this->validator($request->all(), 'PUT');
        // Validation fails
        if ($validator->fails()) {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_INPUT_FAILED'),
                trans('api.DESCRIPTION_INPUT_FAILED'),
                MessageUtility::getErrorMessageForResponse($validator->errors()->getMessages())
            );

            return response()->json($this->response);
        } else {
			// Get post & Check permission
			$post = $this->checkPostAuthor(Auth::user()->id, $id);
			if ($post) {
				$arrPost = $request->all();
                unset($arrPost['author_id']);
				// Upload file
				if (Input::file('image')) {
					$imageLink = $this->upload();
					$arrPost['image'] = URL::to('/uploads/'. $imageLink);
				}

				if ($post->update($arrPost)) {
					// Update post successfully
					$this->response = MessageUtility::getResponse(
						trans('api.CODE_INPUT_SUCCESS'),
						trans('api.DESCRIPTION_UPDATE_SUCCESS'),
						trans('api.MSG_UPDATE_SUCCESS',['attribute' => 'Post', 'id' => $post->id]),
						$post->toArray()
					);
				} else {
					// Update post failed
					$this->dbError();
				}

			}
        }

        return response()->json($this->response);
    }

    /**
     * Remove post by id.
     * URI: DELETE /api/posts/{id}
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy(Request $request,$id)
    {
        // Validate author id must be an integer
        if (!$this->validateInteger($id,'Post ID')) return response()->json($this->response);

		// Get post & Check permission
		$post = $this->checkPostAuthor(Auth::user()->id, (int) $id);
		if ($post) {
			if ($post->delete()) {
				// Delete post successfully
				$this->response = MessageUtility::getResponse(
					trans('api.CODE_INPUT_SUCCESS'),
					trans('api.DESCRIPTION_DELETE_SUCCESS'),
					trans('api.MSG_DELETE_SUCCESS',['attribute' => 'Post','id' => $id])
				);
			}
		}
		return response()->json($this->response);
    }

    /**
     * Set post active
     *
     * @param  int  $id
     * @return Response
     */
    public function putActive(Request $request, $id)
    {
        // Validate author id must be an integer
        if (!$this->validateInteger($id,'Post ID')) return response()->json($this->response);

        // Check post author
        $user = Auth::user();
        $post = $this->checkPostAuthor($user->id, $id);
        if ($post) {
            $post->status = 1;
            if ($post->save()) {
                // Active post successfully
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_SUCCESS'),
                    trans('api.DESCRIPTION_POST_ACTIVE_SUCCESS'),
                    trans('api.MSG_POST_ACTIVE_SUCCESS',['attribute' => $post->id]),
                    $post->toArray()
                );
            } else {
                $this->dbError();
            }
        }
        return response()->json($this->response);
    }

    /**
     * Set post deactive
     *
     * @param  int  $id
     * @return Response
     */
    public function putDeactive(Request $request, $id)
    {
        // Validate author id must be an integer
        if (!$this->validateInteger($id,'Post ID')) return response()->json($this->response);

        // Check post author
        $user = Auth::user();
        $post = $this->checkPostAuthor($user->id, $id);
        if ($post) {
            $post->status = 0;
            if ($post->save()) {
                // Active post successfully
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_INPUT_SUCCESS'),
                    trans('api.DESCRIPTION_POST_DEACTIVE_SUCCESS'),
                    trans('api.MSG_POST_DEACTIVE_SUCCESS',['attribute' => $post->id]),
                    $post->toArray()
                );
            } else {
                $this->dbError();
            }
        }
        return response()->json($this->response);
    }



    /**
     * Check post exist and get post author.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function checkPostAuthor($author_id, $post_id)
    {
        $post = Post::where('id', (int) $post_id)->first();
        if ($post) {
            if ($post->author_id == $author_id) {
                return $post;
            } else {
                $this->response = MessageUtility::getResponse(
                    trans('api.CODE_PERMISSION_DENIED'),
                    trans('api.DESCRIPTION_PERMISSION_DENIED'),
                    trans('api.MSG_PERMISSION_DENIED')
                );
            }
        } else {
            $this->response = MessageUtility::getResponse(
                trans('api.CODE_DB_NOT_FOUND'),
                trans('api.DESCRIPTION_DB_NOT_FOUND'),
                trans('api.MSG_DB_NOT_FOUND',['attribute' => 'Post'])
            );
        }
        return false;
    }


    /**
     * Get a validator for an incoming request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data, $method)
    {
		switch($method)
        {
            case 'POST':
            {
				return Validator::make($data, [
					'title'   => 'required|max:255',
					'content' => 'required',
					'status'  => 'required|boolean',
					'image'   => 'image|max:1000',
				]);
            }
            case 'PUT':
            case 'PATCH':
            {
				return Validator::make($data, [
					'title'   => 'max:255',
					'status'  => 'boolean',
					'image'   => 'image|max:1000',
				]);
            }
            default: return false;
        }


    }

    /**
     * Upload image.
     *
     * @return string $imageLink
     */
    protected function upload()
    {
        // Upload path
        $destinationPath = 'uploads';
        // Getting image extension
        $extension = Input::file('image')->getClientOriginalExtension();
        // Getting image name
        $name = str_replace('.'. $extension,'',Input::file('image')->getClientOriginalName() );
        // renameing image
        $fileName = $name.'-'.rand(11111,99999).'.'.$extension;
        // uploading file to given path
        Input::file('image')->move($destinationPath, $fileName);

        return $fileName;
    }

}
