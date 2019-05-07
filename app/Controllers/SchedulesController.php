<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class SchedulesController
{
    public function index()
    {
        /*
        select * from `horarios`
        */
        $subjects = DB::table('horarios')->get();
        return $subjects;
    }

    public function store(Request $request)
    {
        /*
        insert into `horarios` (hora_inicio, hora_fin, asignaturas_pensums_id, instalaciones_id)
        values (?);
        */
        DB::table('horarios')->insert([
            'hora_inicio' => $request->hora_inicio,
            'hora_fin' => $request->hora_fin,
            'asignaturas_pensums_id' => $request->asignatura,
            'instalaciones_id' => $request->instalacion
        ]);
        return ["message" => true];
    }
}
