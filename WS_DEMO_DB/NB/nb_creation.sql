use database testing;
use schema notebooks;

CREATE NOTEBOOK nb_from_snowsight; -- this wouldn't show in database explorer, shows up in projects>notebook
show notebooks;

-- nb from stage; this wouldn't show in database explorer, shows up in projects>notebook
CREATE NOTEBOOK nb_from_stage
 FROM '@"TESTING"."NOTEBOOKS"."NB_TEST_STAG"'
 MAIN_FILE = 'nb_local_to_stage.ipynb'
 QUERY_WAREHOUSE = DEVELOPMENT;

EXECUTE NOTEBOOK TESTING.NOTEBOOKS.NB_FROM_STAGE();
DESCRIBE NOTEBOOK TESTING.NOTEBOOKS.NB_FROM_STAGE;


-- locate workspace path
LIST 'snow://workspace/USER$.PUBLIC.DEFAULT$/versions/live/';

LIST 'snow://workspace/USER$DECLOUD6.PUBLIC.DEFAULT$/versions/live/';

LIST 'snow://workspace/USER$DECLOUD6.PUBLIC."snowflake-workspaces"/versions/live/';

 -- nb from workspace, shows up in database explorer
 CREATE OR REPLACE NOTEBOOK PROJECT testing.notebooks.nb_from_workspace
  FROM 'snow://workspace/USER$DECLOUD6.PUBLIC."snowflake-workspaces"/versions/head'
  COMMENT = 'Notebook project test';

EXECUTE NOTEBOOK PROJECT analytics_db.workflow_schema.workflow_proj
  MAIN_FILE = 'jobs/nightly_etl.ipynb'
  QUERY_WAREHOUSE = 'ETL_WH';

show notebook projects;

-- create dbt project from workspace; git integration probably needed
create or replace dbt project TASTY_BYTES_DBT_DB.DEV.TASTY_BYTES_DBT_PROJECT_1
	from snow://workspace/USER$DECLOUD6.PUBLIC."dbt"/versions/live/tasty_bytes_dbt_demo/;

SHOW WORKSPACES IN DATABASE USER$DECLOUD6 ;

DESC WORKSPACE 'USER$DECLOUD6'.'PUBLIC'.'snowflake-workspaces'

DESC WORKSPACE dbt_projects