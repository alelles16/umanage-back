<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class FacilitiesController
{
    public function index()
    {
        /*
        select * from `instalaciones`
        */
        $facilities = DB::table('instalaciones')->get();
        return $facilities;
    }

    public function store(Request $request)
    {
        /*
        insert into `instalaciones` (nombre, cupo_max, tipo, estado, sedes_id)
        values (?);
        */
        DB::table('instalaciones')->insert([
            'nombre' => $request->nombre,
            'cupo_max' => $request->cupo_max,
            'tipo' => $request->tipo,
            'estado' => $request->estado,
            'sedes_id' => $request->sedes_id
        ]);
        return ["message" => true];
    }

    public function facilites_and_features($instalacion)
    {
        /*
        select * from `caracteristicas`
        where `instalaciones_id`=?
        */
        $features = DB::table('caracteristicas')
            ->where('caracteristicas.instalaciones_id', $instalacion)
            ->get();
        return $features;
    }

    public function facilities_and_schedules($instalacion)
    {
        /*
        select * from `horarios`
        where `instalaciones_id`=?
        */
        $schedules = DB::table('horarios')
            ->where('horarios.instalaciones_id', $instalacion)
            ->orderBy('hora_inicio', 'asc')
            ->get();
        return $schedules;
    }
}
