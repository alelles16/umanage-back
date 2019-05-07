<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class AcademicProgramsController
{
    public function index()
    {
        /*
        select * from `programas_academicos`
        */
        $programs = DB::table('programas_academicos')->get();
        return $programs;
    }

    public function store(Request $request)
    {
        /*
        insert into `programas_academicos` (codigo, nombre, num_creditos, snies, estado, coordinador, instituciones_id)
        values (?);
        */
        DB::table('instalaciones')->insert([
            'codigo' => $request->codigo,
            'num_creditos' => $request->num_creditos,
            'snies' => $request->snies,
            'estado' => $request->estado,
            'coordinador' => $request->coordinador,
            'instituciones_id' => $request->instituciones_id
        ]);
        return ["message" => true];
    }
}
