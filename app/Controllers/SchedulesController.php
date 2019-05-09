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
        /**
         * select * from `horarios`
         * where (`hora_inicio` <= ? and `hora_fin` >= ?) 
         * or (`hora_inicio` <= ? and `hora_fin` >= ?) 
         * and (`dia_semana` = ? and `instalaciones_id` = ?)
         */
        $exist_horario = DB::table('horarios')
            ->where(function ($query) use ($request) {
                $query->where('hora_inicio', '<=', $request->hora_inicio)
                    ->where('hora_fin', '>=', $request->hora_inicio);
            })
            ->orWhere(function ($query) use ($request) {
                $query->where('hora_inicio', '<=', $request->hora_final)
                    ->where('hora_fin', '>=', $request->hora_final);
            })
            ->where([
                ['dia_semana', $request->dia_semana],
                ['instalaciones_id', $request->instalacion]
            ])
            ->toSql();
        return $exist_horario;
        if ($exist_horario->count() == 0) {
            /*
                insert into `horarios` (hora_inicio, hora_fin, asignaturas_pensums_id, instalaciones_id)
                values (?);
                */
            DB::table('horarios')->insert([
                'hora_inicio' => $request->hora_inicio,
                'hora_fin' => $request->hora_final,
                'asignaturas_pensums_id' => $request->asignatura,
                'instalaciones_id' => $request->instalacion,
                'dia_semana' => $request->dia_semana
            ]);
            return ["message" => true];
        }
        return ["message" => "El horario ya se encuentra ocupado"];
    }
}
