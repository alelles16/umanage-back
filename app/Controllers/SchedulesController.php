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

        $exist_horario = DB::table('horarios')
            ->where(function ($query) use ($request) {
                $query->where([
                    ['hora_inicio', '>', $request->hora_inicio],
                    ['hora_fin', '<', $request->hora_inicio],
                ])->orWhere([
                    ['hora_inicio', '>', $request->hora_fin],
                    ['hora_fin', '<', $request->hora_fin],

                ]);
            })
            ->where([
                ['dia_semana', $request->dia_semana],
                ['instalaciones_id', $request->instalacion]
            ])
            ->get();

        if (!$exist_horario) {
            DB::table('horarios')->insert([
                'hora_inicio' => $request->hora_inicio,
                'hora_fin' => $request->hora_fin,
                'asignaturas_pensums_id' => $request->asignatura,
                'instalaciones_id' => $request->instalacion,
                'dia_semana' => $request->dia_semana
            ]);
            return ["message" => true];
        }
        return ["message" => "El horario ya se encuentra ocupado"];
    }
}
