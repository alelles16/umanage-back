<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class JourneysController
{
    public function index()
    {
        /*
        select * from `jornadas`
        */
        $positions = DB::table('jornadas')->get();
        return $positions;
    }

    public function store(Request $request)
    {
        /*
        insert into `jornadas` (nombre, hora_inicio, hora_fin)
        values (?);
        */
        DB::table('jornadas')->insert([
            "nombre" => $request->nombre,
            "hora_inicio" => $request->hora_inicio,
            "hora_fin" => $request->hora_fin
        ]);
        return ["message" => true];
    }
}
