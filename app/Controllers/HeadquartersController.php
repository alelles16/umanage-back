<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class HeadquartersController
{
    public function index()
    {
        /*
        select * from `sedes`
        */
        $headquarters = DB::table('sedes')->get();
        return $headquarters;
    }

    public function store(Request $request)
    {
        /*
        insert into `sedes` (nombre, direccion, ciudad, municipio, instituciones_id)
        values (?);
        */
        DB::table('sedes')->insert([
            "nombre" => $request->nombre,
            "direccion" => $request->direccion,
            "ciudad" => $request->ciudad,
            "municipio" => $request->municipio,
            "instituciones_id" => $request->institucion
        ]);
        return ["message" => true];
    }

    public function headquarters_and_journeys($institucion)
    {
        /*
        select * from `jornadas`
        inner join `sedes_jornadas` on `jornadas_id` = `jornadas`.`id`
        inner join `sedes` on `sedes_jornadas`.`sedes_id` = `sedes`.`id`
        where `sedes`.`instituciones_id` = ?
        */
        $result = DB::table('jornadas')
            ->join('sedes_jornadas', 'jornadas_id', '=', 'jornadas.id')
            ->join('sedes', 'sedes_jornadas.sedes_id', '=', 'sedes.id')
            ->where('sedes.instituciones_id', $institucion)
            ->get();
        return $result;
    }

    public function headquarters_add_journeys(Request $request)
    {
        /*
        insert into `sedes_jornadas` (jornadas_id, sedes_id)
        values (?);
        */
        DB::table('sedes_jornadas')->insert([
            "jornadas_id" => $request->jornadas_id,
            "sedes_id" => $request->sedes_id
        ]);
        return ["message" => true];
    }

    public function headquarters_remove_journeys(Request $request)
    {
        /*
        delete from `sedes_jornadas`
        where `jornadas_id`=? and `sedes_id`=?;
        */
        DB::table('sedes_jornadas')->where([
            ["jornadas_id", "=", $request->jornadas_id],
            ["sedes_id", "=", $request->sedes_id]
        ])->delete();
        return ["message" => true];
    }

    public function headquarters_and_facilities($headquarters)
    {
        /*
        select * from `instalaciones`
        where `instalaciones_id`=?
        */
        $facilities = DB::table('instalaciones')
            ->where('instalaciones.sedes_id', $headquarters)
            ->get();
        return $facilities;
    }
}
