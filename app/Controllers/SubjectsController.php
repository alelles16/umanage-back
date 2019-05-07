<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class SubjectsController
{
    public function index()
    {
        /*
        select * from `asignaturas`
        */
        $subjects = DB::table('asignaturas')->get();
        return $subjects;
    }

    public function store(Request $request)
    {
        /*
        insert into `asignaturas` (codigo, nombre, estado)
        values (?);
        */
        DB::table('asignaturas')->insert([
            'codigo' => $request->codigo,
            'nombre' => $request->nombre,
            'estado' => $request->estado
        ]);
        return ["message" => true];
    }
}
