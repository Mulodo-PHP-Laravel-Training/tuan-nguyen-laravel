<?php

namespace App\Http\Controllers\Admin;

use DB;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }
    /**
     * Show the application dashboard to the user.
     *
     * @return Response
     */
    public function index()
    {
        return view('admin/user');
    }

    public function getCollection(Request $request) {
        // Pagination
        $perPage      = ($request->input('per_page') > 0) ? (int) $request->input('per_page') : 10;
        $page         = ($request->input('page')) ? (int) $request->input('page') : 1;
        $totalEntries = User::get()->count();
        $totalPages   = ceil($totalEntries/$perPage);
        $sortby       = ($request->input('sort_by')) ? : 'id';
        $order        = ($request->input('order') == 'asc') ? 'asc' : 'desc';

        $data = User::orderBy($sortby, $order)
                    ->take($perPage)
                    ->skip($perPage * ($page-1) )
                    ->get()
                    ->toArray();


        $return = array(
            array(
                'per_page'      => $perPage,
                'total_entries' => $totalEntries,
                'total_pages'   => $totalPages,
                'page'          => $page,

            ),
            $data
        );
        return response()->json($return);
    }
}