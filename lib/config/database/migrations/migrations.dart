final String exercisesTable = '''
  create table tbl_wk_exercises (
    id integer primary key autoincrement,
    name varchar(255) not null,
    weight_type varchar(20),
    custom_created boolean null,
    id_user varchar(255) null
  );
''';

final String workoutsTable = '''
  create table tbl_wk_workouts (
    -- id integer primary key autoincrement,
    id varchar(255) not null,
    id_user varchar(255),
    name varchar(255),
    created_at datetime,
    updated_at datetime
  );
''';

final String workoutsDetailsTable = '''
  create table tbl_wk_workouts_det (
    id integer primary key autoincrement,
    id_workout varchar(255) null,
    id_exercise integer null,
    set_index integer not null default 0,
    set_type varchar(20) null,
    rest_time integer null default 0,
    weight double null,
    reps integer null,
    notes text null
  );
''';

final String workoutsExercisesTable = '''
  create table tbl_wk_workouts_exercises (
    id integer primary key autoincrement,
    id_exercise integer null,
    id_workout integer null
  );
''';

final String recordsTable = '''
  create table tbl_wk_records (
    id integer primary key autoincrement,
    workout_name varchar(255) null,
    start_time datetime,
    end_time datetime,
    set_type varchar(20) null,
    weight double,
    reps integer,
    weight_type varchar(20) null,
    set_index integer null,
    rest_time integer null,
    exercise varchar(255) null,
    exercise_notes varchar(255) null,
    id_user varchar(255) null,
    sync_status integer null
  );
''';

final String measuresTable = '''
  create table tbl_wk_measures (
    id integer primary key autoincrement,
    name varchar(255) not null,
    description varchar(255),
    value double not null
  );
''';

final List<String> migrations = [
  exercisesTable,
  workoutsTable,
  workoutsDetailsTable,
  workoutsExercisesTable,
  recordsTable,
  measuresTable,
];
