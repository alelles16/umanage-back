<?php
namespace App\Controllers;

use Illuminate\Http\Request;
use App\Functions\DB;
use Illuminate\Routing\ResponseFactory;

class UsersController
{
    public function index()
    {
        /*
        select `usuarios`.`nombres`, `usuarios`.`apellidos`, 
        `usuarios`.`identificacion`, `usuarios`.`email`, 
        `usuarios`.`telefono`, `usuarios`.`direccion`, 
        `usuarios`.`fecha_ingreso`, `cargos`.`nombre` from `usuarios` 
        inner join `cargos` on `cargos`.`id` = `usuarios`.`cargos_id`
        */
        $users = DB::table('usuarios')->select([
            'usuarios.nombres',
            'usuarios.apellidos',
            'usuarios.identificacion',
            'usuarios.email',
            'usuarios.telefono',
            'usuarios.direccion',
            'usuarios.fecha_ingreso',
            'cargos.nombre'
        ])
            ->join('cargos', 'cargos.id', '=', 'usuarios.cargos_id')
            ->get();
        return $users;
    }

    public function store(Request $request)
    {
        /*
         * This function create a new user
         * and return a Json with the information
         * about new user
         */

        /*
        insert into `usuarios` (nombres, apellidos, identificacion, email, contrasena, telefono, direccion,
        fecha_nacimiento, fecha_ingreso, cargos_id, instituciones_id)
        values (?);
        */
        $user = DB::table('usuarios')->insert([
            'nombres' => $request->nombres,
            'apellidos' => $request->apellidos,
            'identificacion' => $request->identificacion,
            'email' => $request->email,
            'contrasena' => password_hash($request->contrasena, PASSWORD_DEFAULT),
            'telefono' => $request->telefono,
            'direccion' => $request->direccion,
            'fecha_nacimiento' => $request->fecha_nacimiento,
            'fecha_ingreso' => $request->fecha_ingreso,
            'cargos_id' => $request->cargo,
            'instituciones_id' => $request->institucion
        ]);
        return $user->toJson();
    }

    public function register(Request $request)
    {
        /*
         * This function create a new user, new institution, his position
         * and return True of False
        
        
         Can you use this JSON example to create a new register:
         {
            "nombre": "U Prueba",
            "nit": "123.123.123",
            "ciudad": "Cartagena",
            "municipio": "Cartagena",
            "direccion_institucion": "Cll 23 N 5",
            "email_institucion": "ctg@uprueba.co",
            "estado": 1,
            "nombres": "Prueba",
            "apellidos": "Prueba",
            "identificacion": "1234567",
            "email_usuario": "prueba@adminprueba.co",
            "contrasena": "-",
            "telefono": "321323234",
            "direccion_usuario": "Cll 78 N 1",
            "fecha_nacimiento": "1992/02/02",
            "fecha_ingreso": "2019/09/09"
         }
        */
        $institution = DB::table('instituciones')->insertGetId([
            'nombre' => $request->nombre,
            'nit' => $request->nit,
            'ciudad' => $request->ciudad,
            'municipio' => $request->municipio,
            'direccion' => $request->direccion_institucion,
            'email' => $request->email_institucion,
            'estado' => $request->estado
        ]);
        if ($institution) {
            $user = DB::table('usuarios')->insertGetId([
                'nombres' => $request->nombres,
                'apellidos' => $request->apellidos,
                'identificacion' => $request->identificacion,
                'email' => $request->email_usuario,
                'contrasena' => password_hash($request->contrasena, PASSWORD_DEFAULT),
                'telefono' => $request->telefono,
                'direccion' => $request->direccion_usuario,
                'fecha_nacimiento' => $request->fecha_nacimiento,
                'fecha_ingreso' => $request->fecha_ingreso,
                'cargos_id' => 1,
                'instituciones_id' => $institution
            ]);
            if ($user) {
                DB::table('usuarios_roles')->insert([
                    'usuarios_id' => $user,
                    'roles_id' => 1
                ]);
                return ["message" => true];
            }
            return ["message" => false];
        }
        return ["message" => false];
    }

    public function login(Request $request)
    {
        $user = DB::table('usuarios')->where([
            ['email', $request->email_usuario]
        ])->first();

        if ($user && password_verify($request->contrasena, $user->contrasena)) {
            return ResponseFactory::json($user);
        }
        return ["message" => false];
    }
}
