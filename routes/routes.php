<?php
// Implements Laravel Routing tool
use Illuminate\Routing\Router;

$router->group(['namespace' => 'App\Controllers'], function (Router $router) {

    // Routes for auth
    $router->post('/registro', ['name' => 'users.register', 'uses' => 'UsersController@register']);
    $router->post('/iniciar_sesion', ['name' => 'users.login', 'uses' => 'UsersController@login']);

    // Routes for users
    $router->get('/usuarios', ['name' => 'users.index', 'uses' => 'UsersController@index']);
    $router->post('/usuario', ['name' => 'users.store', 'uses' => 'UsersController@store']);

    // Routes for positions
    $router->get('/cargos', ['name' => 'positions.index', 'uses' => 'PositionsController@index']);
    $router->post('/cargo', ['name' => 'positions.store', 'uses' => 'PositionsController@store']);

    // Routes for institutions
    $router->get('/instituciones', ['name' => 'institutions.index', 'uses' => 'InstitutionsController@index']);
    $router->get('/institucion/{institution}/usuarios', ['name' => 'institutions.users', 'uses' => 'InstitutionsController@users_for_institution']);
    $router->get('/institucion/{institucion}/sedes', ['name' => 'institutions.headquarters', 'uses' => 'InstitutionsController@headquarters_for_institution']);
    $router->get('/institucion/{institucion}/programas_academicos', ['name' => 'institutions.programas', 'uses' => 'InstitutionsController@programs_for_institution']);
    $router->get('/institucion/{institucion}/sedes/jornadas', ['name' => 'institutions.headquarters.journeys', 'uses' => 'HeadquartersController@headquarters_and_journeys']);
    $router->get('/institucion/sede/{sede}/instalaciones', ['name' => 'institutions.headquarters.facilities', 'uses' => 'HeadquartersController@headquarters_and_facilities']);

    $router->post('/institucion', ['name' => 'institutions.store', 'uses' => 'InstitutionsController@store']);
    $router->post('/institucion/{institucion}/sedes/jornada', ['name' => 'institutions.headquarters.journey', 'uses' => 'HeadquartersController@headquarters_add_journeys']);
    $router->post('/institucion/{institucion}/sedes/jornada', ['name' => 'institutions.headquarters.journey.remove', 'uses' => 'HeadquartersController@headquarters_remove_journeys']);

    // Routes for headquarters
    $router->get('/sedes', ['name' => 'headquarters.index', 'uses' => 'HeadquartersController@index']);
    $router->post('/sede', ['name' => 'headquarters.store', 'uses' => 'HeadquartersController@store']);

    // Routes for journeys
    $router->get('/jornadas', ['name' => 'journeys.index', 'uses' => 'JourneysController@index']);
    $router->post('/jornada', ['name' => 'journeys.store', 'uses' => 'JourneysController@store']);

    // Routes for facilities
    $router->get('/instalaciones', ['name' => 'facilities.index', 'uses' => 'FacilititesController@index']);
    $router->get('/instalacion/{instalacion}/caracteristicas', ['name' => 'facilities.features', 'uses' => 'FacilititesController@facilites_and_features']);
    $router->get('/instalacion/{instalacion}/horario', ['name' => 'facilities.schedule', 'uses' => 'FacilititesController@facilities_and_schedules']);
    $router->post('/instalacion', ['name' => 'facilities.store', 'uses' => 'FacilititesController@store']);

    // Routes for features
    $router->get('/caracteristicas', ['name' => 'features.index', 'uses' => 'FeaturesController@index']);
    $router->post('/caracteristica', ['name' => 'features.store', 'uses' => 'FeaturesController@store']);

    // Routes for academic programs
    $router->get('/programas_academicos', ['name' => 'academic_programs.index', 'uses' => 'AcademicProgramsController@index']);
    $router->get('/programas_academico/{programa}/pensums', ['name' => 'academic_programs.pensums', 'uses' => 'AcademicProgramsController@pensums_for_programs']);
    $router->post('/programa_academico', ['name' => 'academic_programs.store', 'uses' => 'AcademicProgramsController@store']);

    // Routes for pensums
    $router->get('/pensums', ['name' => 'pensums.index', 'uses' => 'PensumsController@index']);
    $router->post('/pensum', ['name' => 'pensums.store', 'uses' => 'PensumsController@store']);
    $router->post('/pensum/agregar_asignatura', ['name' => 'pensums.subject_add', 'uses' => 'PensumsController@pensums_add_subject']);
    $router->post('/pensum/remover_asignatura', ['name' => 'pensums.subject_remove', 'uses' => 'PensumsController@pensums_remove_subject']);

    // Routes for subjects
    $router->get('/asignaturas', ['name' => 'subjects.index', 'uses' => 'SubjectsController@index']);
    $router->post('/asignatura', ['name' => 'subjects.store', 'uses' => 'SubjectsController@store']);

    // Routes for semesters
    $router->get('/semestres', ['name' => 'semesters.index', 'uses' => 'SemestersController@index']);
    $router->post('/semestre', ['name' => 'semesters.store', 'uses' => 'SemestersController@store']);

    // Routes for schedules
    $router->get('/horarios', ['name' => 'schedules.index', 'uses' => 'SchedulesController@index']);
    $router->post('/horario', ['name' => 'schedules.store', 'uses' => 'SchedulesController@store']);
});
