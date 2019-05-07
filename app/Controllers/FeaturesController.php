<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;

class FeaturesController
{
    public function index()
    {
        /*
        select * from `caracteristicas`
        */
        $facilities = DB::table('caracteristicas')->get();
        return $facilities;
    }

    public function store(Request $request)
    {
        /*
        insert into `caracteristicas` (valor, nombre, instalaciones_id)
        values (?);
        */
        DB::table('instalaciones')->insert([
            'valor' => $request->valor,
            'nombre' => $request->nombre,
            'instalaciones_id' => $request->instalaciones_id
        ]);
        return ["message" => true];
    }
}
