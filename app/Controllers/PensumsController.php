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

    public function pensums_add_subject(Request $request)
    {
        /*
        insert into `asignaturas_pensums` (docente, pensums_id, asignaturas_id, semestres_id)
        values (?);
        */
        DB::table('asignaturas_pensums')->insert([
            'docente' => $request->docente,
            'pensums_id' => $request->pensum,
            'asignaturas_id' => $request->asignatura,
            'semestres_id' => $request->semestre,
        ]);
        return ["message" => true];
    }

    public function pensums_remove_subject(Request $request)
    {
        /*
        delete from `asignaturas_pensums`
        where `asignaturas_id`=? and `pensums_id`=?;
        */
        DB::table('asignaturas_pensums')->where([
            ["asignaturas_id", "=", $request->asignatura_id],
            ["pensums_id", "=", $request->pensum_id]
        ])->delete();
        return ["message" => true];
    }
}
