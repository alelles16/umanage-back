<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class InstitutionsController
{
    public function index()
    {
        /*
        select * from `instituciones`
        */
        $institutions = DB::table('instituciones')->get();
        return $institutions;
    }

    public function store(Request $request)
    {
        /*
        insert into `instituciones` (nombre, nit, ciudad, municipio, direccion, email, estado)
        values (nombre, nit, ciudad, municipio, direccion, email, estado);
        */
        DB::table('instituciones')->insert([
            'nombre' => $request->nombre,
            'nit' => $request->nit,
            'ciudad' => $request->ciudad,
            'municipio' => $request->municipio,
            'direccion' => $request->direccion,
            'email' => $request->email_institucion,
            'estado' => $request->estado
        ]);
        return ["message" => true];
    }

    public function users_for_institution($institution)
    {
        /*
        select * from `usuarios` where `usuarios`.`instituciones_id` = ?
        */
        $users = DB::table('usuarios')->where('usuarios.instituciones_id', $institution)->get();
        return $users;
    }

    public function headquarters_for_institution($institution)
    {
        /*
        select * from `sedes` where `sedes`.`instituciones_id` = ?
        */
        $headquarters = DB::table('sedes')->where('sedes.instituciones_id', $institution)->get();
        return $headquarters;
    }
}
