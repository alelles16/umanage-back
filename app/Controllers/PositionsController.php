<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class PositionsController
{
    public function index()
    {
        /*
        select * from `cargos`
        */
        $positions = DB::table('cargos')->get();
        return $positions;
    }

    public function store(Request $request)
    {
        /*
        insert into `cargos` (nombre)
        values (?);
        */
        DB::table('cargos')->insert([
            "nombre" => $request->nombre
        ]);
        return ["message" => true];
    }
}
