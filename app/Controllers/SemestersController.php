<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class SemestersController
{
    public function index()
    {
        /*
        select * from `semestres`
        */
        $semesters = DB::table('semestres')->get();
        return $semesters;
    }

    public function store(Request $request)
    {
        /*
        insert into `semestres` (codigo, nombre, estado)
        values (?);
        */
        DB::table('semestres')->insert([
            'codigo' => $request->codigo,
            'nombre' => $request->nombre,
            'estado' => $request->estado
        ]);
        return ["message" => true];
    }
}
