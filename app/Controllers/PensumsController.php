<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class PensumsController
{
    public function index()
    {
        /*
        select * from `pensums`
        */
        $pensums = DB::table('pensums')->get();
        return $pensums;
    }

    public function store(Request $request)
    {
        /*
        insert into `pensums` (nombre, estado, es_principal, programas_academicos_id)
        values (?);
        */
        DB::table('pensums')->insert([
            'nombre' => $request->nombre,
            'estado' => $request->estado,
            'es_principal' => $request->es_principal,
            'programas_academicos_id' => $request->programa_id,
        ]);
        return ["message" => true];
    }
}
