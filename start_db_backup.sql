PGDMP     )            	        {            demo1    14.6    15.1 ?               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    57922    demo1    DATABASE     q   CREATE DATABASE demo1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.UTF-8';
    DROP DATABASE demo1;
                postgres    false                        2615    2200    public    SCHEMA     2   -- *not* creating schema, since initdb creates it
 2   -- *not* dropping schema, since initdb creates it
                postgres    false                       0    0    SCHEMA public    ACL     Q   REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    4            ?            1259    58302    act_dmn_databasechangelog    TABLE     a  CREATE TABLE public.act_dmn_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 -   DROP TABLE public.act_dmn_databasechangelog;
       public         heap    postgres    false    4            ?            1259    58297    act_dmn_databasechangeloglock    TABLE     ?   CREATE TABLE public.act_dmn_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 1   DROP TABLE public.act_dmn_databasechangeloglock;
       public         heap    postgres    false    4            ?            1259    58321    act_dmn_decision    TABLE     ?  CREATE TABLE public.act_dmn_decision (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    version_ integer,
    key_ character varying(255),
    category_ character varying(255),
    deployment_id_ character varying(255),
    tenant_id_ character varying(255),
    resource_name_ character varying(255),
    description_ character varying(255),
    decision_type_ character varying(255)
);
 $   DROP TABLE public.act_dmn_decision;
       public         heap    postgres    false    4            ?            1259    58307    act_dmn_deployment    TABLE     #  CREATE TABLE public.act_dmn_deployment (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    deploy_time_ timestamp without time zone,
    tenant_id_ character varying(255),
    parent_deployment_id_ character varying(255)
);
 &   DROP TABLE public.act_dmn_deployment;
       public         heap    postgres    false    4            ?            1259    58314    act_dmn_deployment_resource    TABLE     ?   CREATE TABLE public.act_dmn_deployment_resource (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    deployment_id_ character varying(255),
    resource_bytes_ bytea
);
 /   DROP TABLE public.act_dmn_deployment_resource;
       public         heap    postgres    false    4            ?            1259    58328    act_dmn_hi_decision_execution    TABLE       CREATE TABLE public.act_dmn_hi_decision_execution (
    id_ character varying(255) NOT NULL,
    decision_definition_id_ character varying(255),
    deployment_id_ character varying(255),
    start_time_ timestamp without time zone,
    end_time_ timestamp without time zone,
    instance_id_ character varying(255),
    execution_id_ character varying(255),
    activity_id_ character varying(255),
    failed_ boolean DEFAULT false,
    tenant_id_ character varying(255),
    execution_json_ text,
    scope_type_ character varying(255)
);
 1   DROP TABLE public.act_dmn_hi_decision_execution;
       public         heap    postgres    false    4                       1259    58638    act_evt_log    TABLE     ?  CREATE TABLE public.act_evt_log (
    log_nr_ integer NOT NULL,
    type_ character varying(64),
    proc_def_id_ character varying(64),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    task_id_ character varying(64),
    time_stamp_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    data_ bytea,
    lock_owner_ character varying(255),
    lock_time_ timestamp without time zone,
    is_processed_ smallint DEFAULT 0
);
    DROP TABLE public.act_evt_log;
       public         heap    postgres    false    4                       1259    58637    act_evt_log_log_nr__seq    SEQUENCE     ?   CREATE SEQUENCE public.act_evt_log_log_nr__seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.act_evt_log_log_nr__seq;
       public          postgres    false    279    4                       0    0    act_evt_log_log_nr__seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.act_evt_log_log_nr__seq OWNED BY public.act_evt_log.log_nr_;
          public          postgres    false    278            ?            1259    58170    act_ge_bytearray    TABLE     ?   CREATE TABLE public.act_ge_bytearray (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    deployment_id_ character varying(64),
    bytes_ bytea,
    generated_ boolean
);
 $   DROP TABLE public.act_ge_bytearray;
       public         heap    postgres    false    4            ?            1259    58165    act_ge_property    TABLE     ?   CREATE TABLE public.act_ge_property (
    name_ character varying(64) NOT NULL,
    value_ character varying(300),
    rev_ integer
);
 #   DROP TABLE public.act_ge_property;
       public         heap    postgres    false    4                       1259    58872    act_hi_actinst    TABLE       CREATE TABLE public.act_hi_actinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_def_id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64) NOT NULL,
    execution_id_ character varying(64) NOT NULL,
    act_id_ character varying(255) NOT NULL,
    task_id_ character varying(64),
    call_proc_inst_id_ character varying(64),
    act_name_ character varying(255),
    act_type_ character varying(255) NOT NULL,
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    transaction_order_ integer,
    duration_ bigint,
    delete_reason_ character varying(4000),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 "   DROP TABLE public.act_hi_actinst;
       public         heap    postgres    false    4                       1259    58895    act_hi_attachment    TABLE     ?  CREATE TABLE public.act_hi_attachment (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(255),
    name_ character varying(255),
    description_ character varying(4000),
    type_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    url_ character varying(4000),
    content_id_ character varying(64),
    time_ timestamp without time zone
);
 %   DROP TABLE public.act_hi_attachment;
       public         heap    postgres    false    4                       1259    58888    act_hi_comment    TABLE     r  CREATE TABLE public.act_hi_comment (
    id_ character varying(64) NOT NULL,
    type_ character varying(255),
    time_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    action_ character varying(255),
    message_ character varying(4000),
    full_msg_ bytea
);
 "   DROP TABLE public.act_hi_comment;
       public         heap    postgres    false    4                       1259    58881    act_hi_detail    TABLE     I  CREATE TABLE public.act_hi_detail (
    id_ character varying(64) NOT NULL,
    type_ character varying(255) NOT NULL,
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    task_id_ character varying(64),
    act_inst_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(64),
    rev_ integer,
    time_ timestamp without time zone NOT NULL,
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000)
);
 !   DROP TABLE public.act_hi_detail;
       public         heap    postgres    false    4                       1259    58372    act_hi_entitylink    TABLE     ?  CREATE TABLE public.act_hi_entitylink (
    id_ character varying(64) NOT NULL,
    link_type_ character varying(255),
    create_time_ timestamp without time zone,
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    parent_element_id_ character varying(255),
    ref_scope_id_ character varying(255),
    ref_scope_type_ character varying(255),
    ref_scope_definition_id_ character varying(255),
    root_scope_id_ character varying(255),
    root_scope_type_ character varying(255),
    hierarchy_type_ character varying(255)
);
 %   DROP TABLE public.act_hi_entitylink;
       public         heap    postgres    false    4                        1259    58350    act_hi_identitylink    TABLE     ?  CREATE TABLE public.act_hi_identitylink (
    id_ character varying(64) NOT NULL,
    group_id_ character varying(255),
    type_ character varying(255),
    user_id_ character varying(255),
    task_id_ character varying(64),
    create_time_ timestamp without time zone,
    proc_inst_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255)
);
 '   DROP TABLE public.act_hi_identitylink;
       public         heap    postgres    false    4                       1259    58861    act_hi_procinst    TABLE     ?  CREATE TABLE public.act_hi_procinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_inst_id_ character varying(64) NOT NULL,
    business_key_ character varying(255),
    proc_def_id_ character varying(64) NOT NULL,
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    start_user_id_ character varying(255),
    start_act_id_ character varying(255),
    end_act_id_ character varying(255),
    super_process_instance_id_ character varying(64),
    delete_reason_ character varying(4000),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    name_ character varying(255),
    callback_id_ character varying(255),
    callback_type_ character varying(255),
    reference_id_ character varying(255),
    reference_type_ character varying(255),
    propagated_stage_inst_id_ character varying(255),
    business_status_ character varying(255)
);
 #   DROP TABLE public.act_hi_procinst;
       public         heap    postgres    false    4                       1259    58405    act_hi_taskinst    TABLE     ?  CREATE TABLE public.act_hi_taskinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_def_id_ character varying(64),
    task_def_id_ character varying(64),
    task_def_key_ character varying(255),
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    propagated_stage_inst_id_ character varying(255),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    owner_ character varying(255),
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    claim_time_ timestamp without time zone,
    end_time_ timestamp without time zone,
    duration_ bigint,
    delete_reason_ character varying(4000),
    priority_ integer,
    due_date_ timestamp without time zone,
    form_key_ character varying(255),
    category_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    last_updated_time_ timestamp without time zone
);
 #   DROP TABLE public.act_hi_taskinst;
       public         heap    postgres    false    4                       1259    58415    act_hi_tsk_log    TABLE     u  CREATE TABLE public.act_hi_tsk_log (
    id_ integer NOT NULL,
    type_ character varying(64),
    task_id_ character varying(64) NOT NULL,
    time_stamp_ timestamp without time zone NOT NULL,
    user_id_ character varying(255),
    data_ character varying(4000),
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    scope_id_ character varying(255),
    scope_definition_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 "   DROP TABLE public.act_hi_tsk_log;
       public         heap    postgres    false    4                       1259    58414    act_hi_tsk_log_id__seq    SEQUENCE     ?   CREATE SEQUENCE public.act_hi_tsk_log_id__seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.act_hi_tsk_log_id__seq;
       public          postgres    false    263    4                       0    0    act_hi_tsk_log_id__seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.act_hi_tsk_log_id__seq OWNED BY public.act_hi_tsk_log.id_;
          public          postgres    false    262            	           1259    58442    act_hi_varinst    TABLE     ?  CREATE TABLE public.act_hi_varinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_inst_id_ character varying(64),
    execution_id_ character varying(64),
    task_id_ character varying(64),
    name_ character varying(255) NOT NULL,
    var_type_ character varying(100),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000),
    create_time_ timestamp without time zone,
    last_updated_time_ timestamp without time zone
);
 "   DROP TABLE public.act_hi_varinst;
       public         heap    postgres    false    4            ?            1259    58222    act_id_bytearray    TABLE     ?   CREATE TABLE public.act_id_bytearray (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    bytes_ bytea
);
 $   DROP TABLE public.act_id_bytearray;
       public         heap    postgres    false    4            ?            1259    58229    act_id_group    TABLE     ?   CREATE TABLE public.act_id_group (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    type_ character varying(255)
);
     DROP TABLE public.act_id_group;
       public         heap    postgres    false    4            ?            1259    58249    act_id_info    TABLE     #  CREATE TABLE public.act_id_info (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    user_id_ character varying(64),
    type_ character varying(64),
    key_ character varying(255),
    value_ character varying(255),
    password_ bytea,
    parent_id_ character varying(255)
);
    DROP TABLE public.act_id_info;
       public         heap    postgres    false    4            ?            1259    58236    act_id_membership    TABLE     ?   CREATE TABLE public.act_id_membership (
    user_id_ character varying(64) NOT NULL,
    group_id_ character varying(64) NOT NULL
);
 %   DROP TABLE public.act_id_membership;
       public         heap    postgres    false    4            ?            1259    58263    act_id_priv    TABLE     w   CREATE TABLE public.act_id_priv (
    id_ character varying(64) NOT NULL,
    name_ character varying(255) NOT NULL
);
    DROP TABLE public.act_id_priv;
       public         heap    postgres    false    4            ?            1259    58268    act_id_priv_mapping    TABLE     ?   CREATE TABLE public.act_id_priv_mapping (
    id_ character varying(64) NOT NULL,
    priv_id_ character varying(64) NOT NULL,
    user_id_ character varying(255),
    group_id_ character varying(255)
);
 '   DROP TABLE public.act_id_priv_mapping;
       public         heap    postgres    false    4            ?            1259    58217    act_id_property    TABLE     ?   CREATE TABLE public.act_id_property (
    name_ character varying(64) NOT NULL,
    value_ character varying(300),
    rev_ integer
);
 #   DROP TABLE public.act_id_property;
       public         heap    postgres    false    4            ?            1259    58256    act_id_token    TABLE     S  CREATE TABLE public.act_id_token (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    token_value_ character varying(255),
    token_date_ timestamp without time zone,
    ip_address_ character varying(255),
    user_agent_ character varying(255),
    user_id_ character varying(255),
    token_data_ character varying(2000)
);
     DROP TABLE public.act_id_token;
       public         heap    postgres    false    4            ?            1259    58241    act_id_user    TABLE     }  CREATE TABLE public.act_id_user (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    first_ character varying(255),
    last_ character varying(255),
    display_name_ character varying(255),
    email_ character varying(255),
    pwd_ character varying(255),
    picture_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
    DROP TABLE public.act_id_user;
       public         heap    postgres    false    4                       1259    58647    act_procdef_info    TABLE     ?   CREATE TABLE public.act_procdef_info (
    id_ character varying(64) NOT NULL,
    proc_def_id_ character varying(64) NOT NULL,
    rev_ integer,
    info_json_id_ character varying(64)
);
 $   DROP TABLE public.act_procdef_info;
       public         heap    postgres    false    4                       1259    58604    act_re_deployment    TABLE     ?  CREATE TABLE public.act_re_deployment (
    id_ character varying(64) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    key_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    deploy_time_ timestamp without time zone,
    derived_from_ character varying(64),
    derived_from_root_ character varying(64),
    parent_deployment_id_ character varying(255),
    engine_version_ character varying(255)
);
 %   DROP TABLE public.act_re_deployment;
       public         heap    postgres    false    4                       1259    58612    act_re_model    TABLE     B  CREATE TABLE public.act_re_model (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    name_ character varying(255),
    key_ character varying(255),
    category_ character varying(255),
    create_time_ timestamp without time zone,
    last_update_time_ timestamp without time zone,
    version_ integer,
    meta_info_ character varying(4000),
    deployment_id_ character varying(64),
    editor_source_value_id_ character varying(64),
    editor_source_extra_value_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
     DROP TABLE public.act_re_model;
       public         heap    postgres    false    4                       1259    58628    act_re_procdef    TABLE       CREATE TABLE public.act_re_procdef (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    name_ character varying(255),
    key_ character varying(255) NOT NULL,
    version_ integer NOT NULL,
    deployment_id_ character varying(64),
    resource_name_ character varying(4000),
    dgrm_resource_name_ character varying(4000),
    description_ character varying(4000),
    has_start_form_key_ boolean,
    has_graphical_notation_ boolean,
    suspension_state_ integer,
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    derived_from_ character varying(64),
    derived_from_root_ character varying(64),
    derived_version_ integer DEFAULT 0 NOT NULL,
    engine_version_ character varying(255)
);
 "   DROP TABLE public.act_re_procdef;
       public         heap    postgres    false    4                       1259    58652    act_ru_actinst    TABLE       CREATE TABLE public.act_ru_actinst (
    id_ character varying(64) NOT NULL,
    rev_ integer DEFAULT 1,
    proc_def_id_ character varying(64) NOT NULL,
    proc_inst_id_ character varying(64) NOT NULL,
    execution_id_ character varying(64) NOT NULL,
    act_id_ character varying(255) NOT NULL,
    task_id_ character varying(64),
    call_proc_inst_id_ character varying(64),
    act_name_ character varying(255),
    act_type_ character varying(255) NOT NULL,
    assignee_ character varying(255),
    start_time_ timestamp without time zone NOT NULL,
    end_time_ timestamp without time zone,
    duration_ bigint,
    transaction_order_ integer,
    delete_reason_ character varying(4000),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 "   DROP TABLE public.act_ru_actinst;
       public         heap    postgres    false    4                       1259    58477    act_ru_deadletter_job    TABLE       CREATE TABLE public.act_ru_deadletter_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 )   DROP TABLE public.act_ru_deadletter_job;
       public         heap    postgres    false    4                       1259    58361    act_ru_entitylink    TABLE     ?  CREATE TABLE public.act_ru_entitylink (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    create_time_ timestamp without time zone,
    link_type_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    parent_element_id_ character varying(255),
    ref_scope_id_ character varying(255),
    ref_scope_type_ character varying(255),
    ref_scope_definition_id_ character varying(255),
    root_scope_id_ character varying(255),
    root_scope_type_ character varying(255),
    hierarchy_type_ character varying(255)
);
 %   DROP TABLE public.act_ru_entitylink;
       public         heap    postgres    false    4                       1259    58383    act_ru_event_subscr    TABLE     ?  CREATE TABLE public.act_ru_event_subscr (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    event_type_ character varying(255) NOT NULL,
    event_name_ character varying(255),
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    activity_id_ character varying(64),
    configuration_ character varying(255),
    created_ timestamp without time zone NOT NULL,
    proc_def_id_ character varying(64),
    sub_scope_id_ character varying(64),
    scope_id_ character varying(64),
    scope_definition_id_ character varying(64),
    scope_type_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 '   DROP TABLE public.act_ru_event_subscr;
       public         heap    postgres    false    4                       1259    58620    act_ru_execution    TABLE     ?  CREATE TABLE public.act_ru_execution (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    proc_inst_id_ character varying(64),
    business_key_ character varying(255),
    parent_id_ character varying(64),
    proc_def_id_ character varying(64),
    super_exec_ character varying(64),
    root_proc_inst_id_ character varying(64),
    act_id_ character varying(255),
    is_active_ boolean,
    is_concurrent_ boolean,
    is_scope_ boolean,
    is_event_scope_ boolean,
    is_mi_root_ boolean,
    suspension_state_ integer,
    cached_ent_state_ integer,
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    name_ character varying(255),
    start_act_id_ character varying(255),
    start_time_ timestamp without time zone,
    start_user_id_ character varying(255),
    lock_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    is_count_enabled_ boolean,
    evt_subscr_count_ integer,
    task_count_ integer,
    job_count_ integer,
    timer_job_count_ integer,
    susp_job_count_ integer,
    deadletter_job_count_ integer,
    external_worker_job_count_ integer,
    var_count_ integer,
    id_link_count_ integer,
    callback_id_ character varying(255),
    callback_type_ character varying(255),
    reference_id_ character varying(255),
    reference_type_ character varying(255),
    propagated_stage_inst_id_ character varying(255),
    business_status_ character varying(255)
);
 $   DROP TABLE public.act_ru_execution;
       public         heap    postgres    false    4                       1259    58493    act_ru_external_job    TABLE     ?  CREATE TABLE public.act_ru_external_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 '   DROP TABLE public.act_ru_external_job;
       public         heap    postgres    false    4                       1259    58485    act_ru_history_job    TABLE     y  CREATE TABLE public.act_ru_history_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    adv_handler_cfg_id_ character varying(64),
    create_time_ timestamp without time zone,
    scope_type_ character varying(255),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 &   DROP TABLE public.act_ru_history_job;
       public         heap    postgres    false    4            ?            1259    58338    act_ru_identitylink    TABLE     ?  CREATE TABLE public.act_ru_identitylink (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    group_id_ character varying(255),
    type_ character varying(255),
    user_id_ character varying(255),
    task_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255)
);
 '   DROP TABLE public.act_ru_identitylink;
       public         heap    postgres    false    4            
           1259    58453 
   act_ru_job    TABLE     y  CREATE TABLE public.act_ru_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
    DROP TABLE public.act_ru_job;
       public         heap    postgres    false    4                       1259    58469    act_ru_suspended_job    TABLE     +  CREATE TABLE public.act_ru_suspended_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 (   DROP TABLE public.act_ru_suspended_job;
       public         heap    postgres    false    4                       1259    58393    act_ru_task    TABLE     ?  CREATE TABLE public.act_ru_task (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    proc_def_id_ character varying(64),
    task_def_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    propagated_stage_inst_id_ character varying(255),
    name_ character varying(255),
    parent_task_id_ character varying(64),
    description_ character varying(4000),
    task_def_key_ character varying(255),
    owner_ character varying(255),
    assignee_ character varying(255),
    delegation_ character varying(64),
    priority_ integer,
    create_time_ timestamp without time zone,
    due_date_ timestamp without time zone,
    category_ character varying(255),
    suspension_state_ integer,
    tenant_id_ character varying(255) DEFAULT ''::character varying,
    form_key_ character varying(255),
    claim_time_ timestamp without time zone,
    is_count_enabled_ boolean,
    var_count_ integer,
    id_link_count_ integer,
    sub_task_count_ integer
);
    DROP TABLE public.act_ru_task;
       public         heap    postgres    false    4                       1259    58461    act_ru_timer_job    TABLE       CREATE TABLE public.act_ru_timer_job (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    category_ character varying(255),
    type_ character varying(255) NOT NULL,
    lock_exp_time_ timestamp without time zone,
    lock_owner_ character varying(255),
    exclusive_ boolean,
    execution_id_ character varying(64),
    process_instance_id_ character varying(64),
    proc_def_id_ character varying(64),
    element_id_ character varying(255),
    element_name_ character varying(255),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    scope_definition_id_ character varying(255),
    correlation_id_ character varying(255),
    retries_ integer,
    exception_stack_id_ character varying(64),
    exception_msg_ character varying(4000),
    duedate_ timestamp without time zone,
    repeat_ character varying(255),
    handler_type_ character varying(255),
    handler_cfg_ character varying(4000),
    custom_values_id_ character varying(64),
    create_time_ timestamp without time zone,
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 $   DROP TABLE public.act_ru_timer_job;
       public         heap    postgres    false    4                       1259    58427    act_ru_variable    TABLE     F  CREATE TABLE public.act_ru_variable (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(255) NOT NULL,
    name_ character varying(255) NOT NULL,
    execution_id_ character varying(64),
    proc_inst_id_ character varying(64),
    task_id_ character varying(64),
    scope_id_ character varying(255),
    sub_scope_id_ character varying(255),
    scope_type_ character varying(255),
    bytearray_id_ character varying(64),
    double_ double precision,
    long_ bigint,
    text_ character varying(4000),
    text2_ character varying(4000)
);
 #   DROP TABLE public.act_ru_variable;
       public         heap    postgres    false    4            ?            1259    58093    bpm_content_storage    TABLE       CREATE TABLE public.bpm_content_storage (
    id uuid NOT NULL,
    name character varying(1000) NOT NULL,
    content bytea,
    type_ character varying(255),
    author_id character varying(255),
    version integer NOT NULL,
    created_by character varying(255),
    created_date timestamp without time zone,
    last_modified_by character varying(255),
    last_modified_date timestamp without time zone,
    deleted_by character varying(255),
    deleted_date timestamp without time zone,
    sys_tenant_id character varying(255)
);
 '   DROP TABLE public.bpm_content_storage;
       public         heap    postgres    false    4            ?            1259    58100    bpm_user_group    TABLE       CREATE TABLE public.bpm_user_group (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    description text,
    type_ character varying(255),
    version integer NOT NULL,
    created_by character varying(255),
    created_date timestamp without time zone,
    last_modified_by character varying(255),
    last_modified_date timestamp without time zone,
    deleted_by character varying(255),
    deleted_date timestamp without time zone,
    sys_tenant_id character varying(255)
);
 "   DROP TABLE public.bpm_user_group;
       public         heap    postgres    false    4            ?            1259    58107    bpm_user_group_role    TABLE     ?  CREATE TABLE public.bpm_user_group_role (
    id uuid NOT NULL,
    user_group_id uuid,
    role_code character varying(255),
    version integer NOT NULL,
    created_by character varying(255),
    created_date timestamp without time zone,
    last_modified_by character varying(255),
    last_modified_date timestamp without time zone,
    deleted_by character varying(255),
    deleted_date timestamp without time zone,
    sys_tenant_id character varying(255)
);
 '   DROP TABLE public.bpm_user_group_role;
       public         heap    postgres    false    4            ?            1259    58114    bpm_user_group_user    TABLE     ?  CREATE TABLE public.bpm_user_group_user (
    id uuid NOT NULL,
    username character varying(255) NOT NULL,
    version integer NOT NULL,
    created_by character varying(255),
    created_date timestamp without time zone,
    last_modified_by character varying(255),
    last_modified_date timestamp without time zone,
    deleted_by character varying(255),
    deleted_date timestamp without time zone,
    user_group_id uuid,
    sys_tenant_id character varying(255)
);
 '   DROP TABLE public.bpm_user_group_user;
       public         heap    postgres    false    4            ?            1259    58142 
   d_category    TABLE     ^  CREATE TABLE public.d_category (
    id character varying(10) NOT NULL,
    description character varying(255) NOT NULL,
    uuid uuid,
    version integer NOT NULL,
    created_by character varying(255),
    created_date timestamp without time zone,
    last_modified_by character varying(255),
    last_modified_date timestamp without time zone
);
    DROP TABLE public.d_category;
       public         heap    postgres    false    4            ?            1259    58149 
   d_customer    TABLE     ?  CREATE TABLE public.d_customer (
    id uuid NOT NULL,
    version integer NOT NULL,
    created_by character varying(255),
    created_date timestamp without time zone,
    last_modified_by character varying(255),
    last_modified_date timestamp without time zone,
    company character varying(255) NOT NULL,
    email character varying(255),
    category_id character varying(10) NOT NULL
);
    DROP TABLE public.d_customer;
       public         heap    postgres    false    4            ?            1259    58134    d_user    TABLE     R  CREATE TABLE public.d_user (
    id uuid NOT NULL,
    version integer NOT NULL,
    username character varying(255) NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    password character varying(255),
    email character varying(255),
    active boolean,
    time_zone_id character varying(255)
);
    DROP TABLE public.d_user;
       public         heap    postgres    false    4            ?            1259    57928    databasechangelog    TABLE     Y  CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 %   DROP TABLE public.databasechangelog;
       public         heap    postgres    false    4            ?            1259    57923    databasechangeloglock    TABLE     ?   CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 )   DROP TABLE public.databasechangeloglock;
       public         heap    postgres    false    4            ?            1259    58209    flw_channel_definition    TABLE     ?  CREATE TABLE public.flw_channel_definition (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    version_ integer,
    key_ character varying(255),
    category_ character varying(255),
    deployment_id_ character varying(255),
    create_time_ timestamp(3) without time zone,
    tenant_id_ character varying(255),
    resource_name_ character varying(255),
    description_ character varying(255),
    type_ character varying(255),
    implementation_ character varying(255)
);
 *   DROP TABLE public.flw_channel_definition;
       public         heap    postgres    false    4            ?            1259    58182    flw_ev_databasechangelog    TABLE     `  CREATE TABLE public.flw_ev_databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);
 ,   DROP TABLE public.flw_ev_databasechangelog;
       public         heap    postgres    false    4            ?            1259    58177    flw_ev_databasechangeloglock    TABLE     ?   CREATE TABLE public.flw_ev_databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);
 0   DROP TABLE public.flw_ev_databasechangeloglock;
       public         heap    postgres    false    4            ?            1259    58201    flw_event_definition    TABLE     {  CREATE TABLE public.flw_event_definition (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    version_ integer,
    key_ character varying(255),
    category_ character varying(255),
    deployment_id_ character varying(255),
    tenant_id_ character varying(255),
    resource_name_ character varying(255),
    description_ character varying(255)
);
 (   DROP TABLE public.flw_event_definition;
       public         heap    postgres    false    4            ?            1259    58187    flw_event_deployment    TABLE     (  CREATE TABLE public.flw_event_deployment (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    category_ character varying(255),
    deploy_time_ timestamp(3) without time zone,
    tenant_id_ character varying(255),
    parent_deployment_id_ character varying(255)
);
 (   DROP TABLE public.flw_event_deployment;
       public         heap    postgres    false    4            ?            1259    58194    flw_event_resource    TABLE     ?   CREATE TABLE public.flw_event_resource (
    id_ character varying(255) NOT NULL,
    name_ character varying(255),
    deployment_id_ character varying(255),
    resource_bytes_ bytea
);
 &   DROP TABLE public.flw_event_resource;
       public         heap    postgres    false    4                       1259    58582    flw_ru_batch    TABLE     ?  CREATE TABLE public.flw_ru_batch (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    type_ character varying(64) NOT NULL,
    search_key_ character varying(255),
    search_key2_ character varying(255),
    create_time_ timestamp without time zone NOT NULL,
    complete_time_ timestamp without time zone,
    status_ character varying(255),
    batch_doc_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
     DROP TABLE public.flw_ru_batch;
       public         heap    postgres    false    4                       1259    58590    flw_ru_batch_part    TABLE     s  CREATE TABLE public.flw_ru_batch_part (
    id_ character varying(64) NOT NULL,
    rev_ integer,
    batch_id_ character varying(64),
    type_ character varying(64) NOT NULL,
    scope_id_ character varying(64),
    sub_scope_id_ character varying(64),
    scope_type_ character varying(64),
    search_key_ character varying(255),
    search_key2_ character varying(255),
    create_time_ timestamp without time zone NOT NULL,
    complete_time_ timestamp without time zone,
    status_ character varying(255),
    result_doc_id_ character varying(64),
    tenant_id_ character varying(255) DEFAULT ''::character varying
);
 %   DROP TABLE public.flw_ru_batch_part;
       public         heap    postgres    false    4            ?            1259    58006    persistent_logins    TABLE     ?   CREATE TABLE public.persistent_logins (
    series character varying(64) NOT NULL,
    username character varying(64) NOT NULL,
    token character varying(64) NOT NULL,
    last_used timestamp without time zone NOT NULL
);
 %   DROP TABLE public.persistent_logins;
       public         heap    postgres    false    4            ?            1259    58065    report_execution    TABLE     .  CREATE TABLE public.report_execution (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    report_id uuid,
    report_name character varying(255) NOT NULL,
    report_code character varying(255),
    username character varying(255) NOT NULL,
    start_time timestamp without time zone NOT NULL,
    finish_time timestamp without time zone,
    is_success boolean DEFAULT false,
    cancelled boolean DEFAULT false,
    params text,
    error_message text,
    output_document character varying(4000)
);
 $   DROP TABLE public.report_execution;
       public         heap    postgres    false    4            ?            1259    58019    report_group    TABLE     ?  CREATE TABLE public.report_group (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    sys_tenant_id character varying(255),
    title character varying(255) NOT NULL,
    code character varying(255),
    locale_names character varying(4000)
);
     DROP TABLE public.report_group;
       public         heap    postgres    false    4            ?            1259    58027    report_report    TABLE     <  CREATE TABLE public.report_report (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    code character varying(255),
    description character varying(500),
    locale_names text,
    group_id uuid NOT NULL,
    report_type integer,
    default_template_id uuid,
    xml text,
    roles_idx character varying(1000),
    screens_idx character varying(1000),
    input_entity_types_idx character varying(1000),
    rest_access boolean DEFAULT false,
    is_system boolean DEFAULT false,
    sys_tenant_id character varying(255)
);
 !   DROP TABLE public.report_report;
       public         heap    postgres    false    4            ?            1259    58042    report_template    TABLE     ?  CREATE TABLE public.report_template (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    version integer DEFAULT 1 NOT NULL,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    report_id uuid NOT NULL,
    code character varying(50),
    output_type integer DEFAULT 0 NOT NULL,
    is_custom boolean DEFAULT false,
    is_alterable_output boolean DEFAULT false,
    is_groovy boolean DEFAULT false,
    custom_defined_by integer DEFAULT 100,
    custom_class text,
    output_name_pattern character varying(255),
    name character varying(500),
    content bytea
);
 #   DROP TABLE public.report_template;
       public         heap    postgres    false    4            ?            1259    57970    sec_resource_policy    TABLE     U  CREATE TABLE public.sec_resource_policy (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    type_ character varying(255) NOT NULL,
    policy_group character varying(255),
    resource_ character varying(1000) NOT NULL,
    action_ character varying(255) NOT NULL,
    effect character varying(255) NOT NULL,
    role_id uuid NOT NULL
);
 '   DROP TABLE public.sec_resource_policy;
       public         heap    postgres    false    4            ?            1259    57954    sec_resource_role    TABLE     )  CREATE TABLE public.sec_resource_role (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    child_roles text,
    sys_tenant_id character varying(255),
    description text,
    scopes character varying(1000)
);
 %   DROP TABLE public.sec_resource_role;
       public         heap    postgres    false    4            ?            1259    57996    sec_role_assignment    TABLE     ?  CREATE TABLE public.sec_role_assignment (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    username character varying(255) NOT NULL,
    role_code character varying(255) NOT NULL,
    role_type character varying(255) NOT NULL
);
 '   DROP TABLE public.sec_role_assignment;
       public         heap    postgres    false    4            ?            1259    57983    sec_row_level_policy    TABLE     A  CREATE TABLE public.sec_row_level_policy (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    type_ character varying(255) NOT NULL,
    action_ character varying(255) NOT NULL,
    entity_name character varying(255) NOT NULL,
    where_clause text,
    join_clause text,
    script_ text,
    role_id uuid NOT NULL
);
 (   DROP TABLE public.sec_row_level_policy;
       public         heap    postgres    false    4            ?            1259    57962    sec_row_level_role    TABLE       CREATE TABLE public.sec_row_level_role (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    name character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    child_roles text,
    sys_tenant_id character varying(255),
    description text
);
 &   DROP TABLE public.sec_row_level_role;
       public         heap    postgres    false    4            ?            1259    58011    sec_user_substitution    TABLE       CREATE TABLE public.sec_user_substitution (
    id uuid NOT NULL,
    version integer DEFAULT 1 NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    update_ts timestamp without time zone,
    updated_by character varying(50),
    delete_ts timestamp without time zone,
    deleted_by character varying(50),
    username character varying(255) NOT NULL,
    substituted_username character varying(255) NOT NULL,
    start_date timestamp without time zone,
    end_date timestamp without time zone
);
 )   DROP TABLE public.sec_user_substitution;
       public         heap    postgres    false    4            ?            1259    57940    ui_filter_configuration    TABLE     T  CREATE TABLE public.ui_filter_configuration (
    id uuid NOT NULL,
    component_id character varying(255) NOT NULL,
    configuration_id character varying(255) NOT NULL,
    username character varying(255),
    root_condition text,
    sys_tenant_id character varying(255),
    name character varying(255),
    default_for_all boolean
);
 +   DROP TABLE public.ui_filter_configuration;
       public         heap    postgres    false    4            ?            1259    57933 
   ui_setting    TABLE     ?   CREATE TABLE public.ui_setting (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    username character varying(255),
    name character varying(255),
    value_ text
);
    DROP TABLE public.ui_setting;
       public         heap    postgres    false    4            ?            1259    57947    ui_table_presentation    TABLE     ?  CREATE TABLE public.ui_table_presentation (
    id uuid NOT NULL,
    create_ts timestamp without time zone,
    created_by character varying(50),
    component character varying(255),
    name character varying(255),
    settings character varying(4000),
    username character varying(255),
    is_auto_save boolean,
    update_ts timestamp without time zone,
    updated_by character varying(50),
    sys_tenant_id character varying(255),
    is_default boolean
);
 )   DROP TABLE public.ui_table_presentation;
       public         heap    postgres    false    4            ?           2604    58641    act_evt_log log_nr_    DEFAULT     z   ALTER TABLE ONLY public.act_evt_log ALTER COLUMN log_nr_ SET DEFAULT nextval('public.act_evt_log_log_nr__seq'::regclass);
 B   ALTER TABLE public.act_evt_log ALTER COLUMN log_nr_ DROP DEFAULT;
       public          postgres    false    278    279    279            ?           2604    58418    act_hi_tsk_log id_    DEFAULT     x   ALTER TABLE ONLY public.act_hi_tsk_log ALTER COLUMN id_ SET DEFAULT nextval('public.act_hi_tsk_log_id__seq'::regclass);
 A   ALTER TABLE public.act_hi_tsk_log ALTER COLUMN id_ DROP DEFAULT;
       public          postgres    false    263    262    263            ?          0    58302    act_dmn_databasechangelog 
   TABLE DATA           ?   COPY public.act_dmn_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          postgres    false    250   ջ      ?          0    58297    act_dmn_databasechangeloglock 
   TABLE DATA           Z   COPY public.act_dmn_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public          postgres    false    249   ??      ?          0    58321    act_dmn_decision 
   TABLE DATA           ?   COPY public.act_dmn_decision (id_, name_, version_, key_, category_, deployment_id_, tenant_id_, resource_name_, description_, decision_type_) FROM stdin;
    public          postgres    false    253   ?      ?          0    58307    act_dmn_deployment 
   TABLE DATA           t   COPY public.act_dmn_deployment (id_, name_, category_, deploy_time_, tenant_id_, parent_deployment_id_) FROM stdin;
    public          postgres    false    251   9?      ?          0    58314    act_dmn_deployment_resource 
   TABLE DATA           b   COPY public.act_dmn_deployment_resource (id_, name_, deployment_id_, resource_bytes_) FROM stdin;
    public          postgres    false    252   V?      ?          0    58328    act_dmn_hi_decision_execution 
   TABLE DATA           ?   COPY public.act_dmn_hi_decision_execution (id_, decision_definition_id_, deployment_id_, start_time_, end_time_, instance_id_, execution_id_, activity_id_, failed_, tenant_id_, execution_json_, scope_type_) FROM stdin;
    public          postgres    false    254   s?      ?          0    58638    act_evt_log 
   TABLE DATA           ?   COPY public.act_evt_log (log_nr_, type_, proc_def_id_, proc_inst_id_, execution_id_, task_id_, time_stamp_, user_id_, data_, lock_owner_, lock_time_, is_processed_) FROM stdin;
    public          postgres    false    279   ??      ?          0    58170    act_ge_bytearray 
   TABLE DATA           `   COPY public.act_ge_bytearray (id_, rev_, name_, deployment_id_, bytes_, generated_) FROM stdin;
    public          postgres    false    233   ??      ?          0    58165    act_ge_property 
   TABLE DATA           >   COPY public.act_ge_property (name_, value_, rev_) FROM stdin;
    public          postgres    false    232   ʾ      ?          0    58872    act_hi_actinst 
   TABLE DATA           ?   COPY public.act_hi_actinst (id_, rev_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, transaction_order_, duration_, delete_reason_, tenant_id_) FROM stdin;
    public          postgres    false    283   y?      ?          0    58895    act_hi_attachment 
   TABLE DATA           ?   COPY public.act_hi_attachment (id_, rev_, user_id_, name_, description_, type_, task_id_, proc_inst_id_, url_, content_id_, time_) FROM stdin;
    public          postgres    false    286   ??      ?          0    58888    act_hi_comment 
   TABLE DATA           |   COPY public.act_hi_comment (id_, type_, time_, user_id_, task_id_, proc_inst_id_, action_, message_, full_msg_) FROM stdin;
    public          postgres    false    285   ??      ?          0    58881    act_hi_detail 
   TABLE DATA           ?   COPY public.act_hi_detail (id_, type_, proc_inst_id_, execution_id_, task_id_, act_inst_id_, name_, var_type_, rev_, time_, bytearray_id_, double_, long_, text_, text2_) FROM stdin;
    public          postgres    false    284   п      ?          0    58372    act_hi_entitylink 
   TABLE DATA             COPY public.act_hi_entitylink (id_, link_type_, create_time_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, parent_element_id_, ref_scope_id_, ref_scope_type_, ref_scope_definition_id_, root_scope_id_, root_scope_type_, hierarchy_type_) FROM stdin;
    public          postgres    false    258   ??      ?          0    58350    act_hi_identitylink 
   TABLE DATA           ?   COPY public.act_hi_identitylink (id_, group_id_, type_, user_id_, task_id_, create_time_, proc_inst_id_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_) FROM stdin;
    public          postgres    false    256   
?      ?          0    58861    act_hi_procinst 
   TABLE DATA           Y  COPY public.act_hi_procinst (id_, rev_, proc_inst_id_, business_key_, proc_def_id_, start_time_, end_time_, duration_, start_user_id_, start_act_id_, end_act_id_, super_process_instance_id_, delete_reason_, tenant_id_, name_, callback_id_, callback_type_, reference_id_, reference_type_, propagated_stage_inst_id_, business_status_) FROM stdin;
    public          postgres    false    282   '?      ?          0    58405    act_hi_taskinst 
   TABLE DATA           ?  COPY public.act_hi_taskinst (id_, rev_, proc_def_id_, task_def_id_, task_def_key_, proc_inst_id_, execution_id_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, propagated_stage_inst_id_, name_, parent_task_id_, description_, owner_, assignee_, start_time_, claim_time_, end_time_, duration_, delete_reason_, priority_, due_date_, form_key_, category_, tenant_id_, last_updated_time_) FROM stdin;
    public          postgres    false    261   D?      ?          0    58415    act_hi_tsk_log 
   TABLE DATA           ?   COPY public.act_hi_tsk_log (id_, type_, task_id_, time_stamp_, user_id_, data_, execution_id_, proc_inst_id_, proc_def_id_, scope_id_, scope_definition_id_, sub_scope_id_, scope_type_, tenant_id_) FROM stdin;
    public          postgres    false    263   a?      ?          0    58442    act_hi_varinst 
   TABLE DATA           ?   COPY public.act_hi_varinst (id_, rev_, proc_inst_id_, execution_id_, task_id_, name_, var_type_, scope_id_, sub_scope_id_, scope_type_, bytearray_id_, double_, long_, text_, text2_, create_time_, last_updated_time_) FROM stdin;
    public          postgres    false    265   ~?      ?          0    58222    act_id_bytearray 
   TABLE DATA           D   COPY public.act_id_bytearray (id_, rev_, name_, bytes_) FROM stdin;
    public          postgres    false    241   ??      ?          0    58229    act_id_group 
   TABLE DATA           ?   COPY public.act_id_group (id_, rev_, name_, type_) FROM stdin;
    public          postgres    false    242   ??      ?          0    58249    act_id_info 
   TABLE DATA           f   COPY public.act_id_info (id_, rev_, user_id_, type_, key_, value_, password_, parent_id_) FROM stdin;
    public          postgres    false    245   ??      ?          0    58236    act_id_membership 
   TABLE DATA           @   COPY public.act_id_membership (user_id_, group_id_) FROM stdin;
    public          postgres    false    243   ??      ?          0    58263    act_id_priv 
   TABLE DATA           1   COPY public.act_id_priv (id_, name_) FROM stdin;
    public          postgres    false    247   ?      ?          0    58268    act_id_priv_mapping 
   TABLE DATA           Q   COPY public.act_id_priv_mapping (id_, priv_id_, user_id_, group_id_) FROM stdin;
    public          postgres    false    248   ,?      ?          0    58217    act_id_property 
   TABLE DATA           >   COPY public.act_id_property (name_, value_, rev_) FROM stdin;
    public          postgres    false    240   I?      ?          0    58256    act_id_token 
   TABLE DATA           }   COPY public.act_id_token (id_, rev_, token_value_, token_date_, ip_address_, user_agent_, user_id_, token_data_) FROM stdin;
    public          postgres    false    246   ?      ?          0    58241    act_id_user 
   TABLE DATA           u   COPY public.act_id_user (id_, rev_, first_, last_, display_name_, email_, pwd_, picture_id_, tenant_id_) FROM stdin;
    public          postgres    false    244   ??      ?          0    58647    act_procdef_info 
   TABLE DATA           R   COPY public.act_procdef_info (id_, proc_def_id_, rev_, info_json_id_) FROM stdin;
    public          postgres    false    280   ??      ?          0    58604    act_re_deployment 
   TABLE DATA           ?   COPY public.act_re_deployment (id_, name_, category_, key_, tenant_id_, deploy_time_, derived_from_, derived_from_root_, parent_deployment_id_, engine_version_) FROM stdin;
    public          postgres    false    274   ??      ?          0    58612    act_re_model 
   TABLE DATA           ?   COPY public.act_re_model (id_, rev_, name_, key_, category_, create_time_, last_update_time_, version_, meta_info_, deployment_id_, editor_source_value_id_, editor_source_extra_value_id_, tenant_id_) FROM stdin;
    public          postgres    false    275   ??      ?          0    58628    act_re_procdef 
   TABLE DATA           +  COPY public.act_re_procdef (id_, rev_, category_, name_, key_, version_, deployment_id_, resource_name_, dgrm_resource_name_, description_, has_start_form_key_, has_graphical_notation_, suspension_state_, tenant_id_, derived_from_, derived_from_root_, derived_version_, engine_version_) FROM stdin;
    public          postgres    false    277   ?      ?          0    58652    act_ru_actinst 
   TABLE DATA           ?   COPY public.act_ru_actinst (id_, rev_, proc_def_id_, proc_inst_id_, execution_id_, act_id_, task_id_, call_proc_inst_id_, act_name_, act_type_, assignee_, start_time_, end_time_, duration_, transaction_order_, delete_reason_, tenant_id_) FROM stdin;
    public          postgres    false    281   -?      ?          0    58477    act_ru_deadletter_job 
   TABLE DATA           w  COPY public.act_ru_deadletter_job (id_, rev_, category_, type_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
    public          postgres    false    269   J?      ?          0    58361    act_ru_entitylink 
   TABLE DATA             COPY public.act_ru_entitylink (id_, rev_, create_time_, link_type_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, parent_element_id_, ref_scope_id_, ref_scope_type_, ref_scope_definition_id_, root_scope_id_, root_scope_type_, hierarchy_type_) FROM stdin;
    public          postgres    false    257   g?      ?          0    58383    act_ru_event_subscr 
   TABLE DATA           ?   COPY public.act_ru_event_subscr (id_, rev_, event_type_, event_name_, execution_id_, proc_inst_id_, activity_id_, configuration_, created_, proc_def_id_, sub_scope_id_, scope_id_, scope_definition_id_, scope_type_, tenant_id_) FROM stdin;
    public          postgres    false    259   ??      ?          0    58620    act_ru_execution 
   TABLE DATA           v  COPY public.act_ru_execution (id_, rev_, proc_inst_id_, business_key_, parent_id_, proc_def_id_, super_exec_, root_proc_inst_id_, act_id_, is_active_, is_concurrent_, is_scope_, is_event_scope_, is_mi_root_, suspension_state_, cached_ent_state_, tenant_id_, name_, start_act_id_, start_time_, start_user_id_, lock_time_, lock_owner_, is_count_enabled_, evt_subscr_count_, task_count_, job_count_, timer_job_count_, susp_job_count_, deadletter_job_count_, external_worker_job_count_, var_count_, id_link_count_, callback_id_, callback_type_, reference_id_, reference_type_, propagated_stage_inst_id_, business_status_) FROM stdin;
    public          postgres    false    276   ??      ?          0    58493    act_ru_external_job 
   TABLE DATA           ?  COPY public.act_ru_external_job (id_, rev_, category_, type_, lock_exp_time_, lock_owner_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
    public          postgres    false    271   ??      ?          0    58485    act_ru_history_job 
   TABLE DATA           ?   COPY public.act_ru_history_job (id_, rev_, lock_exp_time_, lock_owner_, retries_, exception_stack_id_, exception_msg_, handler_type_, handler_cfg_, custom_values_id_, adv_handler_cfg_id_, create_time_, scope_type_, tenant_id_) FROM stdin;
    public          postgres    false    270   ??      ?          0    58338    act_ru_identitylink 
   TABLE DATA           ?   COPY public.act_ru_identitylink (id_, rev_, group_id_, type_, user_id_, task_id_, proc_inst_id_, proc_def_id_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_) FROM stdin;
    public          postgres    false    255   ??      ?          0    58453 
   act_ru_job 
   TABLE DATA           ?  COPY public.act_ru_job (id_, rev_, category_, type_, lock_exp_time_, lock_owner_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
    public          postgres    false    266   ?      ?          0    58469    act_ru_suspended_job 
   TABLE DATA           ?  COPY public.act_ru_suspended_job (id_, rev_, category_, type_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
    public          postgres    false    268   2?      ?          0    58393    act_ru_task 
   TABLE DATA           ?  COPY public.act_ru_task (id_, rev_, execution_id_, proc_inst_id_, proc_def_id_, task_def_id_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, propagated_stage_inst_id_, name_, parent_task_id_, description_, task_def_key_, owner_, assignee_, delegation_, priority_, create_time_, due_date_, category_, suspension_state_, tenant_id_, form_key_, claim_time_, is_count_enabled_, var_count_, id_link_count_, sub_task_count_) FROM stdin;
    public          postgres    false    260   O?      ?          0    58461    act_ru_timer_job 
   TABLE DATA           ?  COPY public.act_ru_timer_job (id_, rev_, category_, type_, lock_exp_time_, lock_owner_, exclusive_, execution_id_, process_instance_id_, proc_def_id_, element_id_, element_name_, scope_id_, sub_scope_id_, scope_type_, scope_definition_id_, correlation_id_, retries_, exception_stack_id_, exception_msg_, duedate_, repeat_, handler_type_, handler_cfg_, custom_values_id_, create_time_, tenant_id_) FROM stdin;
    public          postgres    false    267   l?      ?          0    58427    act_ru_variable 
   TABLE DATA           ?   COPY public.act_ru_variable (id_, rev_, type_, name_, execution_id_, proc_inst_id_, task_id_, scope_id_, sub_scope_id_, scope_type_, bytearray_id_, double_, long_, text_, text2_) FROM stdin;
    public          postgres    false    264   ??      ?          0    58093    bpm_content_storage 
   TABLE DATA           ?   COPY public.bpm_content_storage (id, name, content, type_, author_id, version, created_by, created_date, last_modified_by, last_modified_date, deleted_by, deleted_date, sys_tenant_id) FROM stdin;
    public          postgres    false    225   ??      ?          0    58100    bpm_user_group 
   TABLE DATA           ?   COPY public.bpm_user_group (id, name, code, description, type_, version, created_by, created_date, last_modified_by, last_modified_date, deleted_by, deleted_date, sys_tenant_id) FROM stdin;
    public          postgres    false    226   ??      ?          0    58107    bpm_user_group_role 
   TABLE DATA           ?   COPY public.bpm_user_group_role (id, user_group_id, role_code, version, created_by, created_date, last_modified_by, last_modified_date, deleted_by, deleted_date, sys_tenant_id) FROM stdin;
    public          postgres    false    227   ??      ?          0    58114    bpm_user_group_user 
   TABLE DATA           ?   COPY public.bpm_user_group_user (id, username, version, created_by, created_date, last_modified_by, last_modified_date, deleted_by, deleted_date, user_group_id, sys_tenant_id) FROM stdin;
    public          postgres    false    228   ??      ?          0    58142 
   d_category 
   TABLE DATA           ?   COPY public.d_category (id, description, uuid, version, created_by, created_date, last_modified_by, last_modified_date) FROM stdin;
    public          postgres    false    230   ?      ?          0    58149 
   d_customer 
   TABLE DATA           ?   COPY public.d_customer (id, version, created_by, created_date, last_modified_by, last_modified_date, company, email, category_id) FROM stdin;
    public          postgres    false    231   7?      ?          0    58134    d_user 
   TABLE DATA           u   COPY public.d_user (id, version, username, first_name, last_name, password, email, active, time_zone_id) FROM stdin;
    public          postgres    false    229   T?      ?          0    57928    databasechangelog 
   TABLE DATA           ?   COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          postgres    false    210   ??      ?          0    57923    databasechangeloglock 
   TABLE DATA           R   COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public          postgres    false    209   9?      ?          0    58209    flw_channel_definition 
   TABLE DATA           ?   COPY public.flw_channel_definition (id_, name_, version_, key_, category_, deployment_id_, create_time_, tenant_id_, resource_name_, description_, type_, implementation_) FROM stdin;
    public          postgres    false    239   ^?      ?          0    58182    flw_ev_databasechangelog 
   TABLE DATA           ?   COPY public.flw_ev_databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
    public          postgres    false    235   {?      ?          0    58177    flw_ev_databasechangeloglock 
   TABLE DATA           Y   COPY public.flw_ev_databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
    public          postgres    false    234   ??      ?          0    58201    flw_event_definition 
   TABLE DATA           ?   COPY public.flw_event_definition (id_, name_, version_, key_, category_, deployment_id_, tenant_id_, resource_name_, description_) FROM stdin;
    public          postgres    false    238   ?      ?          0    58187    flw_event_deployment 
   TABLE DATA           v   COPY public.flw_event_deployment (id_, name_, category_, deploy_time_, tenant_id_, parent_deployment_id_) FROM stdin;
    public          postgres    false    236   5?      ?          0    58194    flw_event_resource 
   TABLE DATA           Y   COPY public.flw_event_resource (id_, name_, deployment_id_, resource_bytes_) FROM stdin;
    public          postgres    false    237   R?      ?          0    58582    flw_ru_batch 
   TABLE DATA           ?   COPY public.flw_ru_batch (id_, rev_, type_, search_key_, search_key2_, create_time_, complete_time_, status_, batch_doc_id_, tenant_id_) FROM stdin;
    public          postgres    false    272   o?      ?          0    58590    flw_ru_batch_part 
   TABLE DATA           ?   COPY public.flw_ru_batch_part (id_, rev_, batch_id_, type_, scope_id_, sub_scope_id_, scope_type_, search_key_, search_key2_, create_time_, complete_time_, status_, result_doc_id_, tenant_id_) FROM stdin;
    public          postgres    false    273   ??      ?          0    58006    persistent_logins 
   TABLE DATA           O   COPY public.persistent_logins (series, username, token, last_used) FROM stdin;
    public          postgres    false    219   ??      ?          0    58065    report_execution 
   TABLE DATA           ?   COPY public.report_execution (id, create_ts, created_by, report_id, report_name, report_code, username, start_time, finish_time, is_success, cancelled, params, error_message, output_document) FROM stdin;
    public          postgres    false    224   ??      ?          0    58019    report_group 
   TABLE DATA           ?   COPY public.report_group (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, sys_tenant_id, title, code, locale_names) FROM stdin;
    public          postgres    false    221   ??      ?          0    58027    report_report 
   TABLE DATA           (  COPY public.report_report (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, name, code, description, locale_names, group_id, report_type, default_template_id, xml, roles_idx, screens_idx, input_entity_types_idx, rest_access, is_system, sys_tenant_id) FROM stdin;
    public          postgres    false    222   g?      ?          0    58042    report_template 
   TABLE DATA           	  COPY public.report_template (id, create_ts, created_by, version, update_ts, updated_by, delete_ts, deleted_by, report_id, code, output_type, is_custom, is_alterable_output, is_groovy, custom_defined_by, custom_class, output_name_pattern, name, content) FROM stdin;
    public          postgres    false    223   ??      ?          0    57970    sec_resource_policy 
   TABLE DATA           ?   COPY public.sec_resource_policy (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, type_, policy_group, resource_, action_, effect, role_id) FROM stdin;
    public          postgres    false    216   ??      ?          0    57954    sec_resource_role 
   TABLE DATA           ?   COPY public.sec_resource_role (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, name, code, child_roles, sys_tenant_id, description, scopes) FROM stdin;
    public          postgres    false    214   ??      ?          0    57996    sec_role_assignment 
   TABLE DATA           ?   COPY public.sec_role_assignment (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, username, role_code, role_type) FROM stdin;
    public          postgres    false    218   ??      ?          0    57983    sec_row_level_policy 
   TABLE DATA           ?   COPY public.sec_row_level_policy (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, type_, action_, entity_name, where_clause, join_clause, script_, role_id) FROM stdin;
    public          postgres    false    217   B?      ?          0    57962    sec_row_level_role 
   TABLE DATA           ?   COPY public.sec_row_level_role (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, name, code, child_roles, sys_tenant_id, description) FROM stdin;
    public          postgres    false    215   _?      ?          0    58011    sec_user_substitution 
   TABLE DATA           ?   COPY public.sec_user_substitution (id, version, create_ts, created_by, update_ts, updated_by, delete_ts, deleted_by, username, substituted_username, start_date, end_date) FROM stdin;
    public          postgres    false    220   |?      ?          0    57940    ui_filter_configuration 
   TABLE DATA           ?   COPY public.ui_filter_configuration (id, component_id, configuration_id, username, root_condition, sys_tenant_id, name, default_for_all) FROM stdin;
    public          postgres    false    212   ??      ?          0    57933 
   ui_setting 
   TABLE DATA           W   COPY public.ui_setting (id, create_ts, created_by, username, name, value_) FROM stdin;
    public          postgres    false    211   ??      ?          0    57947    ui_table_presentation 
   TABLE DATA           ?   COPY public.ui_table_presentation (id, create_ts, created_by, component, name, settings, username, is_auto_save, update_ts, updated_by, sys_tenant_id, is_default) FROM stdin;
    public          postgres    false    213   ??                 0    0    act_evt_log_log_nr__seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.act_evt_log_log_nr__seq', 1, false);
          public          postgres    false    278                       0    0    act_hi_tsk_log_id__seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.act_hi_tsk_log_id__seq', 1, false);
          public          postgres    false    262            /           2606    58327 ,   act_dmn_decision ACT_DMN_DECISION_TABLE_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.act_dmn_decision
    ADD CONSTRAINT "ACT_DMN_DECISION_TABLE_pkey" PRIMARY KEY (id_);
 X   ALTER TABLE ONLY public.act_dmn_decision DROP CONSTRAINT "ACT_DMN_DECISION_TABLE_pkey";
       public            postgres    false    253            -           2606    58320 <   act_dmn_deployment_resource ACT_DMN_DEPLOYMENT_RESOURCE_pkey 
   CONSTRAINT     }   ALTER TABLE ONLY public.act_dmn_deployment_resource
    ADD CONSTRAINT "ACT_DMN_DEPLOYMENT_RESOURCE_pkey" PRIMARY KEY (id_);
 h   ALTER TABLE ONLY public.act_dmn_deployment_resource DROP CONSTRAINT "ACT_DMN_DEPLOYMENT_RESOURCE_pkey";
       public            postgres    false    252            +           2606    58313 *   act_dmn_deployment ACT_DMN_DEPLOYMENT_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.act_dmn_deployment
    ADD CONSTRAINT "ACT_DMN_DEPLOYMENT_pkey" PRIMARY KEY (id_);
 V   ALTER TABLE ONLY public.act_dmn_deployment DROP CONSTRAINT "ACT_DMN_DEPLOYMENT_pkey";
       public            postgres    false    251            2           2606    58335 @   act_dmn_hi_decision_execution ACT_DMN_HI_DECISION_EXECUTION_pkey 
   CONSTRAINT     ?   ALTER TABLE ONLY public.act_dmn_hi_decision_execution
    ADD CONSTRAINT "ACT_DMN_HI_DECISION_EXECUTION_pkey" PRIMARY KEY (id_);
 l   ALTER TABLE ONLY public.act_dmn_hi_decision_execution DROP CONSTRAINT "ACT_DMN_HI_DECISION_EXECUTION_pkey";
       public            postgres    false    254            ?           2606    58140    d_user D_USER_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.d_user
    ADD CONSTRAINT "D_USER_pkey" PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.d_user DROP CONSTRAINT "D_USER_pkey";
       public            postgres    false    229                       2606    58215 2   flw_channel_definition FLW_CHANNEL_DEFINITION_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public.flw_channel_definition
    ADD CONSTRAINT "FLW_CHANNEL_DEFINITION_pkey" PRIMARY KEY (id_);
 ^   ALTER TABLE ONLY public.flw_channel_definition DROP CONSTRAINT "FLW_CHANNEL_DEFINITION_pkey";
       public            postgres    false    239            
           2606    58207 .   flw_event_definition FLW_EVENT_DEFINITION_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.flw_event_definition
    ADD CONSTRAINT "FLW_EVENT_DEFINITION_pkey" PRIMARY KEY (id_);
 Z   ALTER TABLE ONLY public.flw_event_definition DROP CONSTRAINT "FLW_EVENT_DEFINITION_pkey";
       public            postgres    false    238                       2606    58193 .   flw_event_deployment FLW_EVENT_DEPLOYMENT_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.flw_event_deployment
    ADD CONSTRAINT "FLW_EVENT_DEPLOYMENT_pkey" PRIMARY KEY (id_);
 Z   ALTER TABLE ONLY public.flw_event_deployment DROP CONSTRAINT "FLW_EVENT_DEPLOYMENT_pkey";
       public            postgres    false    236                       2606    58200 *   flw_event_resource FLW_EVENT_RESOURCE_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.flw_event_resource
    ADD CONSTRAINT "FLW_EVENT_RESOURCE_pkey" PRIMARY KEY (id_);
 V   ALTER TABLE ONLY public.flw_event_resource DROP CONSTRAINT "FLW_EVENT_RESOURCE_pkey";
       public            postgres    false    237            ?           2606    58073 &   report_execution REPORT_EXECUTION_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT "REPORT_EXECUTION_pkey" PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.report_execution DROP CONSTRAINT "REPORT_EXECUTION_pkey";
       public            postgres    false    224            ?           2606    58026    report_group REPORT_GROUP_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.report_group
    ADD CONSTRAINT "REPORT_GROUP_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.report_group DROP CONSTRAINT "REPORT_GROUP_pkey";
       public            postgres    false    221            ?           2606    58036     report_report REPORT_REPORT_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.report_report
    ADD CONSTRAINT "REPORT_REPORT_pkey" PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.report_report DROP CONSTRAINT "REPORT_REPORT_pkey";
       public            postgres    false    222            ?           2606    58054 $   report_template REPORT_TEMPLATE_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.report_template
    ADD CONSTRAINT "REPORT_TEMPLATE_pkey" PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.report_template DROP CONSTRAINT "REPORT_TEMPLATE_pkey";
       public            postgres    false    223            ?           2606    57977 ,   sec_resource_policy SEC_RESOURCE_POLICY_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sec_resource_policy
    ADD CONSTRAINT "SEC_RESOURCE_POLICY_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.sec_resource_policy DROP CONSTRAINT "SEC_RESOURCE_POLICY_pkey";
       public            postgres    false    216            ?           2606    57961 (   sec_resource_role SEC_RESOURCE_ROLE_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.sec_resource_role
    ADD CONSTRAINT "SEC_RESOURCE_ROLE_pkey" PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.sec_resource_role DROP CONSTRAINT "SEC_RESOURCE_ROLE_pkey";
       public            postgres    false    214            ?           2606    58003 ,   sec_role_assignment SEC_ROLE_ASSIGNMENT_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sec_role_assignment
    ADD CONSTRAINT "SEC_ROLE_ASSIGNMENT_pkey" PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.sec_role_assignment DROP CONSTRAINT "SEC_ROLE_ASSIGNMENT_pkey";
       public            postgres    false    218            ?           2606    57990 .   sec_row_level_policy SEC_ROW_LEVEL_POLICY_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.sec_row_level_policy
    ADD CONSTRAINT "SEC_ROW_LEVEL_POLICY_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.sec_row_level_policy DROP CONSTRAINT "SEC_ROW_LEVEL_POLICY_pkey";
       public            postgres    false    217            ?           2606    57969 *   sec_row_level_role SEC_ROW_LEVEL_ROLE_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.sec_row_level_role
    ADD CONSTRAINT "SEC_ROW_LEVEL_ROLE_pkey" PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.sec_row_level_role DROP CONSTRAINT "SEC_ROW_LEVEL_ROLE_pkey";
       public            postgres    false    215            ?           2606    58018 0   sec_user_substitution SEC_USER_SUBSTITUTION_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.sec_user_substitution
    ADD CONSTRAINT "SEC_USER_SUBSTITUTION_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.sec_user_substitution DROP CONSTRAINT "SEC_USER_SUBSTITUTION_pkey";
       public            postgres    false    220            ?           2606    57946 4   ui_filter_configuration UI_FILTER_CONFIGURATION_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public.ui_filter_configuration
    ADD CONSTRAINT "UI_FILTER_CONFIGURATION_pkey" PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.ui_filter_configuration DROP CONSTRAINT "UI_FILTER_CONFIGURATION_pkey";
       public            postgres    false    212            ?           2606    57939    ui_setting UI_SETTING_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ui_setting
    ADD CONSTRAINT "UI_SETTING_pkey" PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.ui_setting DROP CONSTRAINT "UI_SETTING_pkey";
       public            postgres    false    211            ?           2606    57953 0   ui_table_presentation UI_TABLE_PRESENTATION_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.ui_table_presentation
    ADD CONSTRAINT "UI_TABLE_PRESENTATION_pkey" PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.ui_table_presentation DROP CONSTRAINT "UI_TABLE_PRESENTATION_pkey";
       public            postgres    false    213            )           2606    58301 @   act_dmn_databasechangeloglock act_dmn_databasechangeloglock_pkey 
   CONSTRAINT     ~   ALTER TABLE ONLY public.act_dmn_databasechangeloglock
    ADD CONSTRAINT act_dmn_databasechangeloglock_pkey PRIMARY KEY (id);
 j   ALTER TABLE ONLY public.act_dmn_databasechangeloglock DROP CONSTRAINT act_dmn_databasechangeloglock_pkey;
       public            postgres    false    249            ?           2606    58646    act_evt_log act_evt_log_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.act_evt_log
    ADD CONSTRAINT act_evt_log_pkey PRIMARY KEY (log_nr_);
 F   ALTER TABLE ONLY public.act_evt_log DROP CONSTRAINT act_evt_log_pkey;
       public            postgres    false    279                       2606    58176 &   act_ge_bytearray act_ge_bytearray_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.act_ge_bytearray
    ADD CONSTRAINT act_ge_bytearray_pkey PRIMARY KEY (id_);
 P   ALTER TABLE ONLY public.act_ge_bytearray DROP CONSTRAINT act_ge_bytearray_pkey;
       public            postgres    false    233            ?           2606    58169 $   act_ge_property act_ge_property_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.act_ge_property
    ADD CONSTRAINT act_ge_property_pkey PRIMARY KEY (name_);
 N   ALTER TABLE ONLY public.act_ge_property DROP CONSTRAINT act_ge_property_pkey;
       public            postgres    false    232            ?           2606    58880 "   act_hi_actinst act_hi_actinst_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.act_hi_actinst
    ADD CONSTRAINT act_hi_actinst_pkey PRIMARY KEY (id_);
 L   ALTER TABLE ONLY public.act_hi_actinst DROP CONSTRAINT act_hi_actinst_pkey;
       public            postgres    false    283            ?           2606    58901 (   act_hi_attachment act_hi_attachment_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.act_hi_attachment
    ADD CONSTRAINT act_hi_attachment_pkey PRIMARY KEY (id_);
 R   ALTER TABLE ONLY public.act_hi_attachment DROP CONSTRAINT act_hi_attachment_pkey;
       public            postgres    false    286            ?           2606    58894 "   act_hi_comment act_hi_comment_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.act_hi_comment
    ADD CONSTRAINT act_hi_comment_pkey PRIMARY KEY (id_);
 L   ALTER TABLE ONLY public.act_hi_comment DROP CONSTRAINT act_hi_comment_pkey;
       public            postgres    false    285            ?           2606    58887     act_hi_detail act_hi_detail_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.act_hi_detail
    ADD CONSTRAINT act_hi_detail_pkey PRIMARY KEY (id_);
 J   ALTER TABLE ONLY public.act_hi_detail DROP CONSTRAINT act_hi_detail_pkey;
       public            postgres    false    284            L           2606    58378 (   act_hi_entitylink act_hi_entitylink_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.act_hi_entitylink
    ADD CONSTRAINT act_hi_entitylink_pkey PRIMARY KEY (id_);
 R   ALTER TABLE ONLY public.act_hi_entitylink DROP CONSTRAINT act_hi_entitylink_pkey;
       public            postgres    false    258            >           2606    58356 ,   act_hi_identitylink act_hi_identitylink_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.act_hi_identitylink
    ADD CONSTRAINT act_hi_identitylink_pkey PRIMARY KEY (id_);
 V   ALTER TABLE ONLY public.act_hi_identitylink DROP CONSTRAINT act_hi_identitylink_pkey;
       public            postgres    false    256            ?           2606    58869 $   act_hi_procinst act_hi_procinst_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_pkey PRIMARY KEY (id_);
 N   ALTER TABLE ONLY public.act_hi_procinst DROP CONSTRAINT act_hi_procinst_pkey;
       public            postgres    false    282            ?           2606    58871 1   act_hi_procinst act_hi_procinst_proc_inst_id__key 
   CONSTRAINT     u   ALTER TABLE ONLY public.act_hi_procinst
    ADD CONSTRAINT act_hi_procinst_proc_inst_id__key UNIQUE (proc_inst_id_);
 [   ALTER TABLE ONLY public.act_hi_procinst DROP CONSTRAINT act_hi_procinst_proc_inst_id__key;
       public            postgres    false    282            _           2606    58413 $   act_hi_taskinst act_hi_taskinst_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.act_hi_taskinst
    ADD CONSTRAINT act_hi_taskinst_pkey PRIMARY KEY (id_);
 N   ALTER TABLE ONLY public.act_hi_taskinst DROP CONSTRAINT act_hi_taskinst_pkey;
       public            postgres    false    261            e           2606    58423 "   act_hi_tsk_log act_hi_tsk_log_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.act_hi_tsk_log
    ADD CONSTRAINT act_hi_tsk_log_pkey PRIMARY KEY (id_);
 L   ALTER TABLE ONLY public.act_hi_tsk_log DROP CONSTRAINT act_hi_tsk_log_pkey;
       public            postgres    false    263            o           2606    58449 "   act_hi_varinst act_hi_varinst_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.act_hi_varinst
    ADD CONSTRAINT act_hi_varinst_pkey PRIMARY KEY (id_);
 L   ALTER TABLE ONLY public.act_hi_varinst DROP CONSTRAINT act_hi_varinst_pkey;
       public            postgres    false    265                       2606    58228 &   act_id_bytearray act_id_bytearray_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.act_id_bytearray
    ADD CONSTRAINT act_id_bytearray_pkey PRIMARY KEY (id_);
 P   ALTER TABLE ONLY public.act_id_bytearray DROP CONSTRAINT act_id_bytearray_pkey;
       public            postgres    false    241                       2606    58235    act_id_group act_id_group_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.act_id_group
    ADD CONSTRAINT act_id_group_pkey PRIMARY KEY (id_);
 H   ALTER TABLE ONLY public.act_id_group DROP CONSTRAINT act_id_group_pkey;
       public            postgres    false    242                       2606    58255    act_id_info act_id_info_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.act_id_info
    ADD CONSTRAINT act_id_info_pkey PRIMARY KEY (id_);
 F   ALTER TABLE ONLY public.act_id_info DROP CONSTRAINT act_id_info_pkey;
       public            postgres    false    245                       2606    58240 (   act_id_membership act_id_membership_pkey 
   CONSTRAINT     w   ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_id_membership_pkey PRIMARY KEY (user_id_, group_id_);
 R   ALTER TABLE ONLY public.act_id_membership DROP CONSTRAINT act_id_membership_pkey;
       public            postgres    false    243    243            $           2606    58274 ,   act_id_priv_mapping act_id_priv_mapping_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.act_id_priv_mapping
    ADD CONSTRAINT act_id_priv_mapping_pkey PRIMARY KEY (id_);
 V   ALTER TABLE ONLY public.act_id_priv_mapping DROP CONSTRAINT act_id_priv_mapping_pkey;
       public            postgres    false    248                        2606    58267    act_id_priv act_id_priv_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.act_id_priv
    ADD CONSTRAINT act_id_priv_pkey PRIMARY KEY (id_);
 F   ALTER TABLE ONLY public.act_id_priv DROP CONSTRAINT act_id_priv_pkey;
       public            postgres    false    247                       2606    58221 $   act_id_property act_id_property_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.act_id_property
    ADD CONSTRAINT act_id_property_pkey PRIMARY KEY (name_);
 N   ALTER TABLE ONLY public.act_id_property DROP CONSTRAINT act_id_property_pkey;
       public            postgres    false    240                       2606    58262    act_id_token act_id_token_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.act_id_token
    ADD CONSTRAINT act_id_token_pkey PRIMARY KEY (id_);
 H   ALTER TABLE ONLY public.act_id_token DROP CONSTRAINT act_id_token_pkey;
       public            postgres    false    246                       2606    58248    act_id_user act_id_user_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.act_id_user
    ADD CONSTRAINT act_id_user_pkey PRIMARY KEY (id_);
 F   ALTER TABLE ONLY public.act_id_user DROP CONSTRAINT act_id_user_pkey;
       public            postgres    false    244            ?           2606    58651 &   act_procdef_info act_procdef_info_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.act_procdef_info
    ADD CONSTRAINT act_procdef_info_pkey PRIMARY KEY (id_);
 P   ALTER TABLE ONLY public.act_procdef_info DROP CONSTRAINT act_procdef_info_pkey;
       public            postgres    false    280            ?           2606    58611 (   act_re_deployment act_re_deployment_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.act_re_deployment
    ADD CONSTRAINT act_re_deployment_pkey PRIMARY KEY (id_);
 R   ALTER TABLE ONLY public.act_re_deployment DROP CONSTRAINT act_re_deployment_pkey;
       public            postgres    false    274            ?           2606    58619    act_re_model act_re_model_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.act_re_model
    ADD CONSTRAINT act_re_model_pkey PRIMARY KEY (id_);
 H   ALTER TABLE ONLY public.act_re_model DROP CONSTRAINT act_re_model_pkey;
       public            postgres    false    275            ?           2606    58636 "   act_re_procdef act_re_procdef_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.act_re_procdef
    ADD CONSTRAINT act_re_procdef_pkey PRIMARY KEY (id_);
 L   ALTER TABLE ONLY public.act_re_procdef DROP CONSTRAINT act_re_procdef_pkey;
       public            postgres    false    277            ?           2606    58660 "   act_ru_actinst act_ru_actinst_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.act_ru_actinst
    ADD CONSTRAINT act_ru_actinst_pkey PRIMARY KEY (id_);
 L   ALTER TABLE ONLY public.act_ru_actinst DROP CONSTRAINT act_ru_actinst_pkey;
       public            postgres    false    281            ?           2606    58484 0   act_ru_deadletter_job act_ru_deadletter_job_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_ru_deadletter_job_pkey PRIMARY KEY (id_);
 Z   ALTER TABLE ONLY public.act_ru_deadletter_job DROP CONSTRAINT act_ru_deadletter_job_pkey;
       public            postgres    false    269            J           2606    58367 (   act_ru_entitylink act_ru_entitylink_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.act_ru_entitylink
    ADD CONSTRAINT act_ru_entitylink_pkey PRIMARY KEY (id_);
 R   ALTER TABLE ONLY public.act_ru_entitylink DROP CONSTRAINT act_ru_entitylink_pkey;
       public            postgres    false    257            T           2606    58390 ,   act_ru_event_subscr act_ru_event_subscr_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.act_ru_event_subscr
    ADD CONSTRAINT act_ru_event_subscr_pkey PRIMARY KEY (id_);
 V   ALTER TABLE ONLY public.act_ru_event_subscr DROP CONSTRAINT act_ru_event_subscr_pkey;
       public            postgres    false    259            ?           2606    58627 &   act_ru_execution act_ru_execution_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_ru_execution_pkey PRIMARY KEY (id_);
 P   ALTER TABLE ONLY public.act_ru_execution DROP CONSTRAINT act_ru_execution_pkey;
       public            postgres    false    276            ?           2606    58500 ,   act_ru_external_job act_ru_external_job_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.act_ru_external_job
    ADD CONSTRAINT act_ru_external_job_pkey PRIMARY KEY (id_);
 V   ALTER TABLE ONLY public.act_ru_external_job DROP CONSTRAINT act_ru_external_job_pkey;
       public            postgres    false    271            ?           2606    58492 *   act_ru_history_job act_ru_history_job_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.act_ru_history_job
    ADD CONSTRAINT act_ru_history_job_pkey PRIMARY KEY (id_);
 T   ALTER TABLE ONLY public.act_ru_history_job DROP CONSTRAINT act_ru_history_job_pkey;
       public            postgres    false    270            <           2606    58344 ,   act_ru_identitylink act_ru_identitylink_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_ru_identitylink_pkey PRIMARY KEY (id_);
 V   ALTER TABLE ONLY public.act_ru_identitylink DROP CONSTRAINT act_ru_identitylink_pkey;
       public            postgres    false    255            ?           2606    58460    act_ru_job act_ru_job_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_ru_job_pkey PRIMARY KEY (id_);
 D   ALTER TABLE ONLY public.act_ru_job DROP CONSTRAINT act_ru_job_pkey;
       public            postgres    false    266            ?           2606    58476 .   act_ru_suspended_job act_ru_suspended_job_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_ru_suspended_job_pkey PRIMARY KEY (id_);
 X   ALTER TABLE ONLY public.act_ru_suspended_job DROP CONSTRAINT act_ru_suspended_job_pkey;
       public            postgres    false    268            ]           2606    58400    act_ru_task act_ru_task_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_ru_task_pkey PRIMARY KEY (id_);
 F   ALTER TABLE ONLY public.act_ru_task DROP CONSTRAINT act_ru_task_pkey;
       public            postgres    false    260            ?           2606    58468 &   act_ru_timer_job act_ru_timer_job_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_ru_timer_job_pkey PRIMARY KEY (id_);
 P   ALTER TABLE ONLY public.act_ru_timer_job DROP CONSTRAINT act_ru_timer_job_pkey;
       public            postgres    false    267            m           2606    58433 $   act_ru_variable act_ru_variable_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_ru_variable_pkey PRIMARY KEY (id_);
 N   ALTER TABLE ONLY public.act_ru_variable DROP CONSTRAINT act_ru_variable_pkey;
       public            postgres    false    264            ?           2606    58860 &   act_procdef_info act_uniq_info_procdef 
   CONSTRAINT     i   ALTER TABLE ONLY public.act_procdef_info
    ADD CONSTRAINT act_uniq_info_procdef UNIQUE (proc_def_id_);
 P   ALTER TABLE ONLY public.act_procdef_info DROP CONSTRAINT act_uniq_info_procdef;
       public            postgres    false    280            "           2606    58296    act_id_priv act_uniq_priv_name 
   CONSTRAINT     Z   ALTER TABLE ONLY public.act_id_priv
    ADD CONSTRAINT act_uniq_priv_name UNIQUE (name_);
 H   ALTER TABLE ONLY public.act_id_priv DROP CONSTRAINT act_uniq_priv_name;
       public            postgres    false    247            ?           2606    58679    act_re_procdef act_uniq_procdef 
   CONSTRAINT     ?   ALTER TABLE ONLY public.act_re_procdef
    ADD CONSTRAINT act_uniq_procdef UNIQUE (key_, version_, derived_version_, tenant_id_);
 I   ALTER TABLE ONLY public.act_re_procdef DROP CONSTRAINT act_uniq_procdef;
       public            postgres    false    277    277    277    277            ?           2606    57927 0   databasechangeloglock databasechangeloglock_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.databasechangeloglock DROP CONSTRAINT databasechangeloglock_pkey;
       public            postgres    false    209                       2606    58181 >   flw_ev_databasechangeloglock flw_ev_databasechangeloglock_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.flw_ev_databasechangeloglock
    ADD CONSTRAINT flw_ev_databasechangeloglock_pkey PRIMARY KEY (id);
 h   ALTER TABLE ONLY public.flw_ev_databasechangeloglock DROP CONSTRAINT flw_ev_databasechangeloglock_pkey;
       public            postgres    false    234            ?           2606    58597 (   flw_ru_batch_part flw_ru_batch_part_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY public.flw_ru_batch_part
    ADD CONSTRAINT flw_ru_batch_part_pkey PRIMARY KEY (id_);
 R   ALTER TABLE ONLY public.flw_ru_batch_part DROP CONSTRAINT flw_ru_batch_part_pkey;
       public            postgres    false    273            ?           2606    58589    flw_ru_batch flw_ru_batch_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public.flw_ru_batch
    ADD CONSTRAINT flw_ru_batch_pkey PRIMARY KEY (id_);
 H   ALTER TABLE ONLY public.flw_ru_batch DROP CONSTRAINT flw_ru_batch_pkey;
       public            postgres    false    272            ?           2606    58157    d_category idx_d_category_unq 
   CONSTRAINT     _   ALTER TABLE ONLY public.d_category
    ADD CONSTRAINT idx_d_category_unq UNIQUE (description);
 G   ALTER TABLE ONLY public.d_category DROP CONSTRAINT idx_d_category_unq;
       public            postgres    false    230            ?           2606    58010 (   persistent_logins persistent_logins_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.persistent_logins
    ADD CONSTRAINT persistent_logins_pkey PRIMARY KEY (series);
 R   ALTER TABLE ONLY public.persistent_logins DROP CONSTRAINT persistent_logins_pkey;
       public            postgres    false    219            ?           2606    58099 *   bpm_content_storage pk_bpm_content_storage 
   CONSTRAINT     h   ALTER TABLE ONLY public.bpm_content_storage
    ADD CONSTRAINT pk_bpm_content_storage PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.bpm_content_storage DROP CONSTRAINT pk_bpm_content_storage;
       public            postgres    false    225            ?           2606    58106     bpm_user_group pk_bpm_user_group 
   CONSTRAINT     ^   ALTER TABLE ONLY public.bpm_user_group
    ADD CONSTRAINT pk_bpm_user_group PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.bpm_user_group DROP CONSTRAINT pk_bpm_user_group;
       public            postgres    false    226            ?           2606    58113 *   bpm_user_group_role pk_bpm_user_group_role 
   CONSTRAINT     h   ALTER TABLE ONLY public.bpm_user_group_role
    ADD CONSTRAINT pk_bpm_user_group_role PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.bpm_user_group_role DROP CONSTRAINT pk_bpm_user_group_role;
       public            postgres    false    227            ?           2606    58120 *   bpm_user_group_user pk_bpm_user_group_user 
   CONSTRAINT     h   ALTER TABLE ONLY public.bpm_user_group_user
    ADD CONSTRAINT pk_bpm_user_group_user PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.bpm_user_group_user DROP CONSTRAINT pk_bpm_user_group_user;
       public            postgres    false    228            ?           2606    58148    d_category pk_d_category 
   CONSTRAINT     V   ALTER TABLE ONLY public.d_category
    ADD CONSTRAINT pk_d_category PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.d_category DROP CONSTRAINT pk_d_category;
       public            postgres    false    230            ?           2606    58155    d_customer pk_d_customer 
   CONSTRAINT     V   ALTER TABLE ONLY public.d_customer
    ADD CONSTRAINT pk_d_customer PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.d_customer DROP CONSTRAINT pk_d_customer;
       public            postgres    false    231            3           1259    58710    act_idx_athrz_procedef    INDEX     ^   CREATE INDEX act_idx_athrz_procedef ON public.act_ru_identitylink USING btree (proc_def_id_);
 *   DROP INDEX public.act_idx_athrz_procedef;
       public            postgres    false    255                       1259    58665    act_idx_bytear_depl    INDEX     Z   CREATE INDEX act_idx_bytear_depl ON public.act_ge_bytearray USING btree (deployment_id_);
 '   DROP INDEX public.act_idx_bytear_depl;
       public            postgres    false    233                       1259    58216    act_idx_channel_def_uniq    INDEX     x   CREATE UNIQUE INDEX act_idx_channel_def_uniq ON public.flw_channel_definition USING btree (key_, version_, tenant_id_);
 ,   DROP INDEX public.act_idx_channel_def_uniq;
       public            postgres    false    239    239    239            ?           1259    58513 %   act_idx_deadletter_job_correlation_id    INDEX     r   CREATE INDEX act_idx_deadletter_job_correlation_id ON public.act_ru_deadletter_job USING btree (correlation_id_);
 9   DROP INDEX public.act_idx_deadletter_job_correlation_id;
       public            postgres    false    269            ?           1259    58512 '   act_idx_deadletter_job_custom_values_id    INDEX     v   CREATE INDEX act_idx_deadletter_job_custom_values_id ON public.act_ru_deadletter_job USING btree (custom_values_id_);
 ;   DROP INDEX public.act_idx_deadletter_job_custom_values_id;
       public            postgres    false    269            ?           1259    58511 )   act_idx_deadletter_job_exception_stack_id    INDEX     z   CREATE INDEX act_idx_deadletter_job_exception_stack_id ON public.act_ru_deadletter_job USING btree (exception_stack_id_);
 =   DROP INDEX public.act_idx_deadletter_job_exception_stack_id;
       public            postgres    false    269            ?           1259    58806 #   act_idx_deadletter_job_execution_id    INDEX     n   CREATE INDEX act_idx_deadletter_job_execution_id ON public.act_ru_deadletter_job USING btree (execution_id_);
 7   DROP INDEX public.act_idx_deadletter_job_execution_id;
       public            postgres    false    269            ?           1259    58818 "   act_idx_deadletter_job_proc_def_id    INDEX     l   CREATE INDEX act_idx_deadletter_job_proc_def_id ON public.act_ru_deadletter_job USING btree (proc_def_id_);
 6   DROP INDEX public.act_idx_deadletter_job_proc_def_id;
       public            postgres    false    269            ?           1259    58812 *   act_idx_deadletter_job_process_instance_id    INDEX     |   CREATE INDEX act_idx_deadletter_job_process_instance_id ON public.act_ru_deadletter_job USING btree (process_instance_id_);
 >   DROP INDEX public.act_idx_deadletter_job_process_instance_id;
       public            postgres    false    269            ?           1259    58576    act_idx_djob_scope    INDEX     f   CREATE INDEX act_idx_djob_scope ON public.act_ru_deadletter_job USING btree (scope_id_, scope_type_);
 &   DROP INDEX public.act_idx_djob_scope;
       public            postgres    false    269    269            ?           1259    58578    act_idx_djob_scope_def    INDEX     u   CREATE INDEX act_idx_djob_scope_def ON public.act_ru_deadletter_job USING btree (scope_definition_id_, scope_type_);
 *   DROP INDEX public.act_idx_djob_scope_def;
       public            postgres    false    269    269            ?           1259    58577    act_idx_djob_sub_scope    INDEX     n   CREATE INDEX act_idx_djob_sub_scope ON public.act_ru_deadletter_job USING btree (sub_scope_id_, scope_type_);
 *   DROP INDEX public.act_idx_djob_sub_scope;
       public            postgres    false    269    269            0           1259    58337    act_idx_dmn_dec_uniq    INDEX     n   CREATE UNIQUE INDEX act_idx_dmn_dec_uniq ON public.act_dmn_decision USING btree (key_, version_, tenant_id_);
 (   DROP INDEX public.act_idx_dmn_dec_uniq;
       public            postgres    false    253    253    253            ?           1259    58579    act_idx_ejob_scope    INDEX     d   CREATE INDEX act_idx_ejob_scope ON public.act_ru_external_job USING btree (scope_id_, scope_type_);
 &   DROP INDEX public.act_idx_ejob_scope;
       public            postgres    false    271    271            ?           1259    58581    act_idx_ejob_scope_def    INDEX     s   CREATE INDEX act_idx_ejob_scope_def ON public.act_ru_external_job USING btree (scope_definition_id_, scope_type_);
 *   DROP INDEX public.act_idx_ejob_scope_def;
       public            postgres    false    271    271            ?           1259    58580    act_idx_ejob_sub_scope    INDEX     l   CREATE INDEX act_idx_ejob_sub_scope ON public.act_ru_external_job USING btree (sub_scope_id_, scope_type_);
 *   DROP INDEX public.act_idx_ejob_sub_scope;
       public            postgres    false    271    271            E           1259    58369    act_idx_ent_lnk_ref_scope    INDEX     }   CREATE INDEX act_idx_ent_lnk_ref_scope ON public.act_ru_entitylink USING btree (ref_scope_id_, ref_scope_type_, link_type_);
 -   DROP INDEX public.act_idx_ent_lnk_ref_scope;
       public            postgres    false    257    257    257            F           1259    58370    act_idx_ent_lnk_root_scope    INDEX     ?   CREATE INDEX act_idx_ent_lnk_root_scope ON public.act_ru_entitylink USING btree (root_scope_id_, root_scope_type_, link_type_);
 .   DROP INDEX public.act_idx_ent_lnk_root_scope;
       public            postgres    false    257    257    257            G           1259    58368    act_idx_ent_lnk_scope    INDEX     q   CREATE INDEX act_idx_ent_lnk_scope ON public.act_ru_entitylink USING btree (scope_id_, scope_type_, link_type_);
 )   DROP INDEX public.act_idx_ent_lnk_scope;
       public            postgres    false    257    257    257            H           1259    58371    act_idx_ent_lnk_scope_def    INDEX     ?   CREATE INDEX act_idx_ent_lnk_scope_def ON public.act_ru_entitylink USING btree (scope_definition_id_, scope_type_, link_type_);
 -   DROP INDEX public.act_idx_ent_lnk_scope_def;
       public            postgres    false    257    257    257                       1259    58208    act_idx_event_def_uniq    INDEX     t   CREATE UNIQUE INDEX act_idx_event_def_uniq ON public.flw_event_definition USING btree (key_, version_, tenant_id_);
 *   DROP INDEX public.act_idx_event_def_uniq;
       public            postgres    false    238    238    238            Q           1259    58392    act_idx_event_subscr    INDEX     ]   CREATE INDEX act_idx_event_subscr ON public.act_ru_event_subscr USING btree (execution_id_);
 (   DROP INDEX public.act_idx_event_subscr;
       public            postgres    false    259            R           1259    58391    act_idx_event_subscr_config_    INDEX     f   CREATE INDEX act_idx_event_subscr_config_ ON public.act_ru_event_subscr USING btree (configuration_);
 0   DROP INDEX public.act_idx_event_subscr_config_;
       public            postgres    false    259            ?           1259    58686    act_idx_exe_parent    INDEX     U   CREATE INDEX act_idx_exe_parent ON public.act_ru_execution USING btree (parent_id_);
 &   DROP INDEX public.act_idx_exe_parent;
       public            postgres    false    276            ?           1259    58698    act_idx_exe_procdef    INDEX     X   CREATE INDEX act_idx_exe_procdef ON public.act_ru_execution USING btree (proc_def_id_);
 '   DROP INDEX public.act_idx_exe_procdef;
       public            postgres    false    276            ?           1259    58680    act_idx_exe_procinst    INDEX     Z   CREATE INDEX act_idx_exe_procinst ON public.act_ru_execution USING btree (proc_inst_id_);
 (   DROP INDEX public.act_idx_exe_procinst;
       public            postgres    false    276            ?           1259    58662    act_idx_exe_root    INDEX     [   CREATE INDEX act_idx_exe_root ON public.act_ru_execution USING btree (root_proc_inst_id_);
 $   DROP INDEX public.act_idx_exe_root;
       public            postgres    false    276            ?           1259    58692    act_idx_exe_super    INDEX     U   CREATE INDEX act_idx_exe_super ON public.act_ru_execution USING btree (super_exec_);
 %   DROP INDEX public.act_idx_exe_super;
       public            postgres    false    276            ?           1259    58661    act_idx_exec_buskey    INDEX     Y   CREATE INDEX act_idx_exec_buskey ON public.act_ru_execution USING btree (business_key_);
 '   DROP INDEX public.act_idx_exec_buskey;
       public            postgres    false    276            ?           1259    58663    act_idx_exec_ref_id_    INDEX     Z   CREATE INDEX act_idx_exec_ref_id_ ON public.act_ru_execution USING btree (reference_id_);
 (   DROP INDEX public.act_idx_exec_ref_id_;
       public            postgres    false    276            ?           1259    58516 #   act_idx_external_job_correlation_id    INDEX     n   CREATE INDEX act_idx_external_job_correlation_id ON public.act_ru_external_job USING btree (correlation_id_);
 7   DROP INDEX public.act_idx_external_job_correlation_id;
       public            postgres    false    271            ?           1259    58515 %   act_idx_external_job_custom_values_id    INDEX     r   CREATE INDEX act_idx_external_job_custom_values_id ON public.act_ru_external_job USING btree (custom_values_id_);
 9   DROP INDEX public.act_idx_external_job_custom_values_id;
       public            postgres    false    271            ?           1259    58514 '   act_idx_external_job_exception_stack_id    INDEX     v   CREATE INDEX act_idx_external_job_exception_stack_id ON public.act_ru_external_job USING btree (exception_stack_id_);
 ;   DROP INDEX public.act_idx_external_job_exception_stack_id;
       public            postgres    false    271            ?           1259    58905    act_idx_hi_act_inst_end    INDEX     W   CREATE INDEX act_idx_hi_act_inst_end ON public.act_hi_actinst USING btree (end_time_);
 +   DROP INDEX public.act_idx_hi_act_inst_end;
       public            postgres    false    283            ?           1259    58915    act_idx_hi_act_inst_exec    INDEX     e   CREATE INDEX act_idx_hi_act_inst_exec ON public.act_hi_actinst USING btree (execution_id_, act_id_);
 ,   DROP INDEX public.act_idx_hi_act_inst_exec;
       public            postgres    false    283    283            ?           1259    58914    act_idx_hi_act_inst_procinst    INDEX     i   CREATE INDEX act_idx_hi_act_inst_procinst ON public.act_hi_actinst USING btree (proc_inst_id_, act_id_);
 0   DROP INDEX public.act_idx_hi_act_inst_procinst;
       public            postgres    false    283    283            ?           1259    58904    act_idx_hi_act_inst_start    INDEX     [   CREATE INDEX act_idx_hi_act_inst_start ON public.act_hi_actinst USING btree (start_time_);
 -   DROP INDEX public.act_idx_hi_act_inst_start;
       public            postgres    false    283            ?           1259    58907    act_idx_hi_detail_act_inst    INDEX     \   CREATE INDEX act_idx_hi_detail_act_inst ON public.act_hi_detail USING btree (act_inst_id_);
 .   DROP INDEX public.act_idx_hi_detail_act_inst;
       public            postgres    false    284            ?           1259    58909    act_idx_hi_detail_name    INDEX     Q   CREATE INDEX act_idx_hi_detail_name ON public.act_hi_detail USING btree (name_);
 *   DROP INDEX public.act_idx_hi_detail_name;
       public            postgres    false    284            ?           1259    58906    act_idx_hi_detail_proc_inst    INDEX     ^   CREATE INDEX act_idx_hi_detail_proc_inst ON public.act_hi_detail USING btree (proc_inst_id_);
 /   DROP INDEX public.act_idx_hi_detail_proc_inst;
       public            postgres    false    284            ?           1259    58910    act_idx_hi_detail_task_id    INDEX     W   CREATE INDEX act_idx_hi_detail_task_id ON public.act_hi_detail USING btree (task_id_);
 -   DROP INDEX public.act_idx_hi_detail_task_id;
       public            postgres    false    284            ?           1259    58908    act_idx_hi_detail_time    INDEX     Q   CREATE INDEX act_idx_hi_detail_time ON public.act_hi_detail USING btree (time_);
 *   DROP INDEX public.act_idx_hi_detail_time;
       public            postgres    false    284            M           1259    58380    act_idx_hi_ent_lnk_ref_scope    INDEX     ?   CREATE INDEX act_idx_hi_ent_lnk_ref_scope ON public.act_hi_entitylink USING btree (ref_scope_id_, ref_scope_type_, link_type_);
 0   DROP INDEX public.act_idx_hi_ent_lnk_ref_scope;
       public            postgres    false    258    258    258            N           1259    58381    act_idx_hi_ent_lnk_root_scope    INDEX     ?   CREATE INDEX act_idx_hi_ent_lnk_root_scope ON public.act_hi_entitylink USING btree (root_scope_id_, root_scope_type_, link_type_);
 1   DROP INDEX public.act_idx_hi_ent_lnk_root_scope;
       public            postgres    false    258    258    258            O           1259    58379    act_idx_hi_ent_lnk_scope    INDEX     t   CREATE INDEX act_idx_hi_ent_lnk_scope ON public.act_hi_entitylink USING btree (scope_id_, scope_type_, link_type_);
 ,   DROP INDEX public.act_idx_hi_ent_lnk_scope;
       public            postgres    false    258    258    258            P           1259    58382    act_idx_hi_ent_lnk_scope_def    INDEX     ?   CREATE INDEX act_idx_hi_ent_lnk_scope_def ON public.act_hi_entitylink USING btree (scope_definition_id_, scope_type_, link_type_);
 0   DROP INDEX public.act_idx_hi_ent_lnk_scope_def;
       public            postgres    false    258    258    258            ?           1259    58917    act_idx_hi_ident_lnk_procinst    INDEX     f   CREATE INDEX act_idx_hi_ident_lnk_procinst ON public.act_hi_identitylink USING btree (proc_inst_id_);
 1   DROP INDEX public.act_idx_hi_ident_lnk_procinst;
       public            postgres    false    256            @           1259    58358    act_idx_hi_ident_lnk_scope    INDEX     l   CREATE INDEX act_idx_hi_ident_lnk_scope ON public.act_hi_identitylink USING btree (scope_id_, scope_type_);
 .   DROP INDEX public.act_idx_hi_ident_lnk_scope;
       public            postgres    false    256    256            A           1259    58360    act_idx_hi_ident_lnk_scope_def    INDEX     {   CREATE INDEX act_idx_hi_ident_lnk_scope_def ON public.act_hi_identitylink USING btree (scope_definition_id_, scope_type_);
 2   DROP INDEX public.act_idx_hi_ident_lnk_scope_def;
       public            postgres    false    256    256            B           1259    58359    act_idx_hi_ident_lnk_sub_scope    INDEX     t   CREATE INDEX act_idx_hi_ident_lnk_sub_scope ON public.act_hi_identitylink USING btree (sub_scope_id_, scope_type_);
 2   DROP INDEX public.act_idx_hi_ident_lnk_sub_scope;
       public            postgres    false    256    256            C           1259    58916    act_idx_hi_ident_lnk_task    INDEX     ]   CREATE INDEX act_idx_hi_ident_lnk_task ON public.act_hi_identitylink USING btree (task_id_);
 -   DROP INDEX public.act_idx_hi_ident_lnk_task;
       public            postgres    false    256            D           1259    58357    act_idx_hi_ident_lnk_user    INDEX     ]   CREATE INDEX act_idx_hi_ident_lnk_user ON public.act_hi_identitylink USING btree (user_id_);
 -   DROP INDEX public.act_idx_hi_ident_lnk_user;
       public            postgres    false    256            ?           1259    58903    act_idx_hi_pro_i_buskey    INDEX     \   CREATE INDEX act_idx_hi_pro_i_buskey ON public.act_hi_procinst USING btree (business_key_);
 +   DROP INDEX public.act_idx_hi_pro_i_buskey;
       public            postgres    false    282            ?           1259    58902    act_idx_hi_pro_inst_end    INDEX     X   CREATE INDEX act_idx_hi_pro_inst_end ON public.act_hi_procinst USING btree (end_time_);
 +   DROP INDEX public.act_idx_hi_pro_inst_end;
       public            postgres    false    282            p           1259    58913    act_idx_hi_procvar_exe    INDEX     Z   CREATE INDEX act_idx_hi_procvar_exe ON public.act_hi_varinst USING btree (execution_id_);
 *   DROP INDEX public.act_idx_hi_procvar_exe;
       public            postgres    false    265            q           1259    58450    act_idx_hi_procvar_name_type    INDEX     c   CREATE INDEX act_idx_hi_procvar_name_type ON public.act_hi_varinst USING btree (name_, var_type_);
 0   DROP INDEX public.act_idx_hi_procvar_name_type;
       public            postgres    false    265    265            r           1259    58911    act_idx_hi_procvar_proc_inst    INDEX     `   CREATE INDEX act_idx_hi_procvar_proc_inst ON public.act_hi_varinst USING btree (proc_inst_id_);
 0   DROP INDEX public.act_idx_hi_procvar_proc_inst;
       public            postgres    false    265            s           1259    58912    act_idx_hi_procvar_task_id    INDEX     Y   CREATE INDEX act_idx_hi_procvar_task_id ON public.act_hi_varinst USING btree (task_id_);
 .   DROP INDEX public.act_idx_hi_procvar_task_id;
       public            postgres    false    265            `           1259    58918    act_idx_hi_task_inst_procinst    INDEX     b   CREATE INDEX act_idx_hi_task_inst_procinst ON public.act_hi_taskinst USING btree (proc_inst_id_);
 1   DROP INDEX public.act_idx_hi_task_inst_procinst;
       public            postgres    false    261            a           1259    58424    act_idx_hi_task_scope    INDEX     c   CREATE INDEX act_idx_hi_task_scope ON public.act_hi_taskinst USING btree (scope_id_, scope_type_);
 )   DROP INDEX public.act_idx_hi_task_scope;
       public            postgres    false    261    261            b           1259    58426    act_idx_hi_task_scope_def    INDEX     r   CREATE INDEX act_idx_hi_task_scope_def ON public.act_hi_taskinst USING btree (scope_definition_id_, scope_type_);
 -   DROP INDEX public.act_idx_hi_task_scope_def;
       public            postgres    false    261    261            c           1259    58425    act_idx_hi_task_sub_scope    INDEX     k   CREATE INDEX act_idx_hi_task_sub_scope ON public.act_hi_taskinst USING btree (sub_scope_id_, scope_type_);
 -   DROP INDEX public.act_idx_hi_task_sub_scope;
       public            postgres    false    261    261            t           1259    58451    act_idx_hi_var_scope_id_type    INDEX     i   CREATE INDEX act_idx_hi_var_scope_id_type ON public.act_hi_varinst USING btree (scope_id_, scope_type_);
 0   DROP INDEX public.act_idx_hi_var_scope_id_type;
       public            postgres    false    265    265            u           1259    58452    act_idx_hi_var_sub_id_type    INDEX     k   CREATE INDEX act_idx_hi_var_sub_id_type ON public.act_hi_varinst USING btree (sub_scope_id_, scope_type_);
 .   DROP INDEX public.act_idx_hi_var_sub_id_type;
       public            postgres    false    265    265            4           1259    58346    act_idx_ident_lnk_group    INDEX     \   CREATE INDEX act_idx_ident_lnk_group ON public.act_ru_identitylink USING btree (group_id_);
 +   DROP INDEX public.act_idx_ident_lnk_group;
       public            postgres    false    255            5           1259    58347    act_idx_ident_lnk_scope    INDEX     i   CREATE INDEX act_idx_ident_lnk_scope ON public.act_ru_identitylink USING btree (scope_id_, scope_type_);
 +   DROP INDEX public.act_idx_ident_lnk_scope;
       public            postgres    false    255    255            6           1259    58349    act_idx_ident_lnk_scope_def    INDEX     x   CREATE INDEX act_idx_ident_lnk_scope_def ON public.act_ru_identitylink USING btree (scope_definition_id_, scope_type_);
 /   DROP INDEX public.act_idx_ident_lnk_scope_def;
       public            postgres    false    255    255            7           1259    58348    act_idx_ident_lnk_sub_scope    INDEX     q   CREATE INDEX act_idx_ident_lnk_sub_scope ON public.act_ru_identitylink USING btree (sub_scope_id_, scope_type_);
 /   DROP INDEX public.act_idx_ident_lnk_sub_scope;
       public            postgres    false    255    255            8           1259    58345    act_idx_ident_lnk_user    INDEX     Z   CREATE INDEX act_idx_ident_lnk_user ON public.act_ru_identitylink USING btree (user_id_);
 *   DROP INDEX public.act_idx_ident_lnk_user;
       public            postgres    false    255            9           1259    58716    act_idx_idl_procinst    INDEX     ]   CREATE INDEX act_idx_idl_procinst ON public.act_ru_identitylink USING btree (proc_inst_id_);
 (   DROP INDEX public.act_idx_idl_procinst;
       public            postgres    false    255            v           1259    58503    act_idx_job_correlation_id    INDEX     \   CREATE INDEX act_idx_job_correlation_id ON public.act_ru_job USING btree (correlation_id_);
 .   DROP INDEX public.act_idx_job_correlation_id;
       public            postgres    false    266            w           1259    58502    act_idx_job_custom_values_id    INDEX     `   CREATE INDEX act_idx_job_custom_values_id ON public.act_ru_job USING btree (custom_values_id_);
 0   DROP INDEX public.act_idx_job_custom_values_id;
       public            postgres    false    266            x           1259    58501    act_idx_job_exception_stack_id    INDEX     d   CREATE INDEX act_idx_job_exception_stack_id ON public.act_ru_job USING btree (exception_stack_id_);
 2   DROP INDEX public.act_idx_job_exception_stack_id;
       public            postgres    false    266            y           1259    58752    act_idx_job_execution_id    INDEX     X   CREATE INDEX act_idx_job_execution_id ON public.act_ru_job USING btree (execution_id_);
 ,   DROP INDEX public.act_idx_job_execution_id;
       public            postgres    false    266            z           1259    58764    act_idx_job_proc_def_id    INDEX     V   CREATE INDEX act_idx_job_proc_def_id ON public.act_ru_job USING btree (proc_def_id_);
 +   DROP INDEX public.act_idx_job_proc_def_id;
       public            postgres    false    266            {           1259    58758    act_idx_job_process_instance_id    INDEX     f   CREATE INDEX act_idx_job_process_instance_id ON public.act_ru_job USING btree (process_instance_id_);
 3   DROP INDEX public.act_idx_job_process_instance_id;
       public            postgres    false    266            |           1259    58567    act_idx_job_scope    INDEX     Z   CREATE INDEX act_idx_job_scope ON public.act_ru_job USING btree (scope_id_, scope_type_);
 %   DROP INDEX public.act_idx_job_scope;
       public            postgres    false    266    266            }           1259    58569    act_idx_job_scope_def    INDEX     i   CREATE INDEX act_idx_job_scope_def ON public.act_ru_job USING btree (scope_definition_id_, scope_type_);
 )   DROP INDEX public.act_idx_job_scope_def;
       public            postgres    false    266    266            ~           1259    58568    act_idx_job_sub_scope    INDEX     b   CREATE INDEX act_idx_job_sub_scope ON public.act_ru_job USING btree (sub_scope_id_, scope_type_);
 )   DROP INDEX public.act_idx_job_sub_scope;
       public            postgres    false    266    266                       1259    58275    act_idx_memb_group    INDEX     U   CREATE INDEX act_idx_memb_group ON public.act_id_membership USING btree (group_id_);
 &   DROP INDEX public.act_idx_memb_group;
       public            postgres    false    243                       1259    58281    act_idx_memb_user    INDEX     S   CREATE INDEX act_idx_memb_user ON public.act_id_membership USING btree (user_id_);
 %   DROP INDEX public.act_idx_memb_user;
       public            postgres    false    243            ?           1259    58841    act_idx_model_deployment    INDEX     [   CREATE INDEX act_idx_model_deployment ON public.act_re_model USING btree (deployment_id_);
 ,   DROP INDEX public.act_idx_model_deployment;
       public            postgres    false    275            ?           1259    58829    act_idx_model_source    INDEX     `   CREATE INDEX act_idx_model_source ON public.act_re_model USING btree (editor_source_value_id_);
 (   DROP INDEX public.act_idx_model_source;
       public            postgres    false    275            ?           1259    58835    act_idx_model_source_extra    INDEX     l   CREATE INDEX act_idx_model_source_extra ON public.act_re_model USING btree (editor_source_extra_value_id_);
 .   DROP INDEX public.act_idx_model_source_extra;
       public            postgres    false    275            %           1259    58294    act_idx_priv_group    INDEX     W   CREATE INDEX act_idx_priv_group ON public.act_id_priv_mapping USING btree (group_id_);
 &   DROP INDEX public.act_idx_priv_group;
       public            postgres    false    248            &           1259    58287    act_idx_priv_mapping    INDEX     X   CREATE INDEX act_idx_priv_mapping ON public.act_id_priv_mapping USING btree (priv_id_);
 (   DROP INDEX public.act_idx_priv_mapping;
       public            postgres    false    248            '           1259    58293    act_idx_priv_user    INDEX     U   CREATE INDEX act_idx_priv_user ON public.act_id_priv_mapping USING btree (user_id_);
 %   DROP INDEX public.act_idx_priv_user;
       public            postgres    false    248            ?           1259    58847    act_idx_procdef_info_json    INDEX     _   CREATE INDEX act_idx_procdef_info_json ON public.act_procdef_info USING btree (info_json_id_);
 -   DROP INDEX public.act_idx_procdef_info_json;
       public            postgres    false    280            ?           1259    58853    act_idx_procdef_info_proc    INDEX     ^   CREATE INDEX act_idx_procdef_info_proc ON public.act_procdef_info USING btree (proc_def_id_);
 -   DROP INDEX public.act_idx_procdef_info_proc;
       public            postgres    false    280            ?           1259    58667    act_idx_ru_acti_end    INDEX     S   CREATE INDEX act_idx_ru_acti_end ON public.act_ru_actinst USING btree (end_time_);
 '   DROP INDEX public.act_idx_ru_acti_end;
       public            postgres    false    281            ?           1259    58670    act_idx_ru_acti_exec    INDEX     X   CREATE INDEX act_idx_ru_acti_exec ON public.act_ru_actinst USING btree (execution_id_);
 (   DROP INDEX public.act_idx_ru_acti_exec;
       public            postgres    false    281            ?           1259    58671    act_idx_ru_acti_exec_act    INDEX     e   CREATE INDEX act_idx_ru_acti_exec_act ON public.act_ru_actinst USING btree (execution_id_, act_id_);
 ,   DROP INDEX public.act_idx_ru_acti_exec_act;
       public            postgres    false    281    281            ?           1259    58668    act_idx_ru_acti_proc    INDEX     X   CREATE INDEX act_idx_ru_acti_proc ON public.act_ru_actinst USING btree (proc_inst_id_);
 (   DROP INDEX public.act_idx_ru_acti_proc;
       public            postgres    false    281            ?           1259    58669    act_idx_ru_acti_proc_act    INDEX     e   CREATE INDEX act_idx_ru_acti_proc_act ON public.act_ru_actinst USING btree (proc_inst_id_, act_id_);
 ,   DROP INDEX public.act_idx_ru_acti_proc_act;
       public            postgres    false    281    281            ?           1259    58666    act_idx_ru_acti_start    INDEX     W   CREATE INDEX act_idx_ru_acti_start ON public.act_ru_actinst USING btree (start_time_);
 )   DROP INDEX public.act_idx_ru_acti_start;
       public            postgres    false    281            ?           1259    58672    act_idx_ru_acti_task    INDEX     S   CREATE INDEX act_idx_ru_acti_task ON public.act_ru_actinst USING btree (task_id_);
 (   DROP INDEX public.act_idx_ru_acti_task;
       public            postgres    false    281            f           1259    58434    act_idx_ru_var_scope_id_type    INDEX     j   CREATE INDEX act_idx_ru_var_scope_id_type ON public.act_ru_variable USING btree (scope_id_, scope_type_);
 0   DROP INDEX public.act_idx_ru_var_scope_id_type;
       public            postgres    false    264    264            g           1259    58435    act_idx_ru_var_sub_id_type    INDEX     l   CREATE INDEX act_idx_ru_var_sub_id_type ON public.act_ru_variable USING btree (sub_scope_id_, scope_type_);
 .   DROP INDEX public.act_idx_ru_var_sub_id_type;
       public            postgres    false    264    264            ?           1259    58573    act_idx_sjob_scope    INDEX     e   CREATE INDEX act_idx_sjob_scope ON public.act_ru_suspended_job USING btree (scope_id_, scope_type_);
 &   DROP INDEX public.act_idx_sjob_scope;
       public            postgres    false    268    268            ?           1259    58575    act_idx_sjob_scope_def    INDEX     t   CREATE INDEX act_idx_sjob_scope_def ON public.act_ru_suspended_job USING btree (scope_definition_id_, scope_type_);
 *   DROP INDEX public.act_idx_sjob_scope_def;
       public            postgres    false    268    268            ?           1259    58574    act_idx_sjob_sub_scope    INDEX     m   CREATE INDEX act_idx_sjob_sub_scope ON public.act_ru_suspended_job USING btree (sub_scope_id_, scope_type_);
 *   DROP INDEX public.act_idx_sjob_sub_scope;
       public            postgres    false    268    268            ?           1259    58510 $   act_idx_suspended_job_correlation_id    INDEX     p   CREATE INDEX act_idx_suspended_job_correlation_id ON public.act_ru_suspended_job USING btree (correlation_id_);
 8   DROP INDEX public.act_idx_suspended_job_correlation_id;
       public            postgres    false    268            ?           1259    58509 &   act_idx_suspended_job_custom_values_id    INDEX     t   CREATE INDEX act_idx_suspended_job_custom_values_id ON public.act_ru_suspended_job USING btree (custom_values_id_);
 :   DROP INDEX public.act_idx_suspended_job_custom_values_id;
       public            postgres    false    268            ?           1259    58508 (   act_idx_suspended_job_exception_stack_id    INDEX     x   CREATE INDEX act_idx_suspended_job_exception_stack_id ON public.act_ru_suspended_job USING btree (exception_stack_id_);
 <   DROP INDEX public.act_idx_suspended_job_exception_stack_id;
       public            postgres    false    268            ?           1259    58788 "   act_idx_suspended_job_execution_id    INDEX     l   CREATE INDEX act_idx_suspended_job_execution_id ON public.act_ru_suspended_job USING btree (execution_id_);
 6   DROP INDEX public.act_idx_suspended_job_execution_id;
       public            postgres    false    268            ?           1259    58800 !   act_idx_suspended_job_proc_def_id    INDEX     j   CREATE INDEX act_idx_suspended_job_proc_def_id ON public.act_ru_suspended_job USING btree (proc_def_id_);
 5   DROP INDEX public.act_idx_suspended_job_proc_def_id;
       public            postgres    false    268            ?           1259    58794 )   act_idx_suspended_job_process_instance_id    INDEX     z   CREATE INDEX act_idx_suspended_job_process_instance_id ON public.act_ru_suspended_job USING btree (process_instance_id_);
 =   DROP INDEX public.act_idx_suspended_job_process_instance_id;
       public            postgres    false    268            U           1259    58401    act_idx_task_create    INDEX     S   CREATE INDEX act_idx_task_create ON public.act_ru_task USING btree (create_time_);
 '   DROP INDEX public.act_idx_task_create;
       public            postgres    false    260            V           1259    58722    act_idx_task_exec    INDEX     R   CREATE INDEX act_idx_task_exec ON public.act_ru_task USING btree (execution_id_);
 %   DROP INDEX public.act_idx_task_exec;
       public            postgres    false    260            W           1259    58734    act_idx_task_procdef    INDEX     T   CREATE INDEX act_idx_task_procdef ON public.act_ru_task USING btree (proc_def_id_);
 (   DROP INDEX public.act_idx_task_procdef;
       public            postgres    false    260            X           1259    58728    act_idx_task_procinst    INDEX     V   CREATE INDEX act_idx_task_procinst ON public.act_ru_task USING btree (proc_inst_id_);
 )   DROP INDEX public.act_idx_task_procinst;
       public            postgres    false    260            Y           1259    58402    act_idx_task_scope    INDEX     \   CREATE INDEX act_idx_task_scope ON public.act_ru_task USING btree (scope_id_, scope_type_);
 &   DROP INDEX public.act_idx_task_scope;
       public            postgres    false    260    260            Z           1259    58404    act_idx_task_scope_def    INDEX     k   CREATE INDEX act_idx_task_scope_def ON public.act_ru_task USING btree (scope_definition_id_, scope_type_);
 *   DROP INDEX public.act_idx_task_scope_def;
       public            postgres    false    260    260            [           1259    58403    act_idx_task_sub_scope    INDEX     d   CREATE INDEX act_idx_task_sub_scope ON public.act_ru_task USING btree (sub_scope_id_, scope_type_);
 *   DROP INDEX public.act_idx_task_sub_scope;
       public            postgres    false    260    260            ?           1259    58506     act_idx_timer_job_correlation_id    INDEX     h   CREATE INDEX act_idx_timer_job_correlation_id ON public.act_ru_timer_job USING btree (correlation_id_);
 4   DROP INDEX public.act_idx_timer_job_correlation_id;
       public            postgres    false    267            ?           1259    58505 "   act_idx_timer_job_custom_values_id    INDEX     l   CREATE INDEX act_idx_timer_job_custom_values_id ON public.act_ru_timer_job USING btree (custom_values_id_);
 6   DROP INDEX public.act_idx_timer_job_custom_values_id;
       public            postgres    false    267            ?           1259    58507    act_idx_timer_job_duedate    INDEX     Z   CREATE INDEX act_idx_timer_job_duedate ON public.act_ru_timer_job USING btree (duedate_);
 -   DROP INDEX public.act_idx_timer_job_duedate;
       public            postgres    false    267            ?           1259    58504 $   act_idx_timer_job_exception_stack_id    INDEX     p   CREATE INDEX act_idx_timer_job_exception_stack_id ON public.act_ru_timer_job USING btree (exception_stack_id_);
 8   DROP INDEX public.act_idx_timer_job_exception_stack_id;
       public            postgres    false    267            ?           1259    58770    act_idx_timer_job_execution_id    INDEX     d   CREATE INDEX act_idx_timer_job_execution_id ON public.act_ru_timer_job USING btree (execution_id_);
 2   DROP INDEX public.act_idx_timer_job_execution_id;
       public            postgres    false    267            ?           1259    58782    act_idx_timer_job_proc_def_id    INDEX     b   CREATE INDEX act_idx_timer_job_proc_def_id ON public.act_ru_timer_job USING btree (proc_def_id_);
 1   DROP INDEX public.act_idx_timer_job_proc_def_id;
       public            postgres    false    267            ?           1259    58776 %   act_idx_timer_job_process_instance_id    INDEX     r   CREATE INDEX act_idx_timer_job_process_instance_id ON public.act_ru_timer_job USING btree (process_instance_id_);
 9   DROP INDEX public.act_idx_timer_job_process_instance_id;
       public            postgres    false    267            ?           1259    58570    act_idx_tjob_scope    INDEX     a   CREATE INDEX act_idx_tjob_scope ON public.act_ru_timer_job USING btree (scope_id_, scope_type_);
 &   DROP INDEX public.act_idx_tjob_scope;
       public            postgres    false    267    267            ?           1259    58572    act_idx_tjob_scope_def    INDEX     p   CREATE INDEX act_idx_tjob_scope_def ON public.act_ru_timer_job USING btree (scope_definition_id_, scope_type_);
 *   DROP INDEX public.act_idx_tjob_scope_def;
       public            postgres    false    267    267            ?           1259    58571    act_idx_tjob_sub_scope    INDEX     i   CREATE INDEX act_idx_tjob_sub_scope ON public.act_ru_timer_job USING btree (sub_scope_id_, scope_type_);
 *   DROP INDEX public.act_idx_tjob_sub_scope;
       public            postgres    false    267    267            :           1259    58704    act_idx_tskass_task    INDEX     W   CREATE INDEX act_idx_tskass_task ON public.act_ru_identitylink USING btree (task_id_);
 '   DROP INDEX public.act_idx_tskass_task;
       public            postgres    false    255            h           1259    58436    act_idx_var_bytearray    INDEX     Z   CREATE INDEX act_idx_var_bytearray ON public.act_ru_variable USING btree (bytearray_id_);
 )   DROP INDEX public.act_idx_var_bytearray;
       public            postgres    false    264            i           1259    58740    act_idx_var_exe    INDEX     T   CREATE INDEX act_idx_var_exe ON public.act_ru_variable USING btree (execution_id_);
 #   DROP INDEX public.act_idx_var_exe;
       public            postgres    false    264            j           1259    58746    act_idx_var_procinst    INDEX     Y   CREATE INDEX act_idx_var_procinst ON public.act_ru_variable USING btree (proc_inst_id_);
 (   DROP INDEX public.act_idx_var_procinst;
       public            postgres    false    264            k           1259    58664    act_idx_variable_task_id    INDEX     X   CREATE INDEX act_idx_variable_task_id ON public.act_ru_variable USING btree (task_id_);
 ,   DROP INDEX public.act_idx_variable_task_id;
       public            postgres    false    264            ?           1259    58598    flw_idx_batch_part    INDEX     U   CREATE INDEX flw_idx_batch_part ON public.flw_ru_batch_part USING btree (batch_id_);
 &   DROP INDEX public.flw_idx_batch_part;
       public            postgres    false    273            ?           1259    58132    idx_bpm_ug_code_tenant    INDEX     ?   CREATE UNIQUE INDEX idx_bpm_ug_code_tenant ON public.bpm_user_group USING btree (code) WHERE ((deleted_date IS NULL) AND (sys_tenant_id IS NULL));
 *   DROP INDEX public.idx_bpm_ug_code_tenant;
       public            postgres    false    226    226    226            ?           1259    58133    idx_bpm_ug_code_tenant_nn    INDEX     ?   CREATE UNIQUE INDEX idx_bpm_ug_code_tenant_nn ON public.bpm_user_group USING btree (code, sys_tenant_id) WHERE ((deleted_date IS NULL) AND (sys_tenant_id IS NOT NULL));
 -   DROP INDEX public.idx_bpm_ug_code_tenant_nn;
       public            postgres    false    226    226    226    226            ?           1259    58158    idx_d_customer_category    INDEX     U   CREATE INDEX idx_d_customer_category ON public.d_customer USING btree (category_id);
 +   DROP INDEX public.idx_d_customer_category;
       public            postgres    false    231            ?           1259    58141    idx_d_user_on_username    INDEX     T   CREATE UNIQUE INDEX idx_d_user_on_username ON public.d_user USING btree (username);
 *   DROP INDEX public.idx_d_user_on_username;
       public            postgres    false    229            ?           1259    58079    idx_report_exec_report_id    INDEX     [   CREATE INDEX idx_report_exec_report_id ON public.report_execution USING btree (report_id);
 -   DROP INDEX public.idx_report_exec_report_id;
       public            postgres    false    224            ?           1259    58080    idx_report_exec_start_time    INDEX     ]   CREATE INDEX idx_report_exec_start_time ON public.report_execution USING btree (start_time);
 .   DROP INDEX public.idx_report_exec_start_time;
       public            postgres    false    224            ?           1259    58081    idx_report_group_uniq_title    INDEX     ?   CREATE UNIQUE INDEX idx_report_group_uniq_title ON public.report_group USING btree (title) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));
 /   DROP INDEX public.idx_report_group_uniq_title;
       public            postgres    false    221    221    221            ?           1259    58082 ,   idx_report_group_uniq_title_sys_tenant_id_nn    INDEX     ?   CREATE UNIQUE INDEX idx_report_group_uniq_title_sys_tenant_id_nn ON public.report_group USING btree (title, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));
 @   DROP INDEX public.idx_report_group_uniq_title_sys_tenant_id_nn;
       public            postgres    false    221    221    221    221            ?           1259    58083    idx_report_report_uniq_name    INDEX     ?   CREATE UNIQUE INDEX idx_report_report_uniq_name ON public.report_report USING btree (name) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NULL));
 /   DROP INDEX public.idx_report_report_uniq_name;
       public            postgres    false    222    222    222            ?           1259    58084 ,   idx_report_report_uniq_name_sys_tenant_id_nn    INDEX     ?   CREATE UNIQUE INDEX idx_report_report_uniq_name_sys_tenant_id_nn ON public.report_report USING btree (name, sys_tenant_id) WHERE ((delete_ts IS NULL) AND (sys_tenant_id IS NOT NULL));
 @   DROP INDEX public.idx_report_report_uniq_name_sys_tenant_id_nn;
       public            postgres    false    222    222    222    222            ?           1259    58004    idx_resource_role_un_c    INDEX     n   CREATE INDEX idx_resource_role_un_c ON public.sec_resource_role USING btree (code) WHERE (delete_ts IS NULL);
 *   DROP INDEX public.idx_resource_role_un_c;
       public            postgres    false    214    214            ?           1259    58005    idx_row_level_role_un_c    INDEX     p   CREATE INDEX idx_row_level_role_un_c ON public.sec_row_level_role USING btree (code) WHERE (delete_ts IS NULL);
 +   DROP INDEX public.idx_row_level_role_un_c;
       public            postgres    false    215    215            ?           2606    58711 )   act_ru_identitylink act_fk_athrz_procedef    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_athrz_procedef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);
 S   ALTER TABLE ONLY public.act_ru_identitylink DROP CONSTRAINT act_fk_athrz_procedef;
       public          postgres    false    255    4035    277            ?           2606    58673 $   act_ge_bytearray act_fk_bytearr_depl    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ge_bytearray
    ADD CONSTRAINT act_fk_bytearr_depl FOREIGN KEY (deployment_id_) REFERENCES public.act_re_deployment(id_);
 N   ALTER TABLE ONLY public.act_ge_bytearray DROP CONSTRAINT act_fk_bytearr_depl;
       public          postgres    false    4019    274    233                       2606    58552 9   act_ru_deadletter_job act_fk_deadletter_job_custom_values    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);
 c   ALTER TABLE ONLY public.act_ru_deadletter_job DROP CONSTRAINT act_fk_deadletter_job_custom_values;
       public          postgres    false    269    233    3841                       2606    58547 5   act_ru_deadletter_job act_fk_deadletter_job_exception    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);
 _   ALTER TABLE ONLY public.act_ru_deadletter_job DROP CONSTRAINT act_fk_deadletter_job_exception;
       public          postgres    false    3841    233    269                       2606    58807 5   act_ru_deadletter_job act_fk_deadletter_job_execution    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_execution FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);
 _   ALTER TABLE ONLY public.act_ru_deadletter_job DROP CONSTRAINT act_fk_deadletter_job_execution;
       public          postgres    false    4033    276    269                       2606    58819 4   act_ru_deadletter_job act_fk_deadletter_job_proc_def    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_proc_def FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);
 ^   ALTER TABLE ONLY public.act_ru_deadletter_job DROP CONSTRAINT act_fk_deadletter_job_proc_def;
       public          postgres    false    277    269    4035                       2606    58813 <   act_ru_deadletter_job act_fk_deadletter_job_process_instance    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_deadletter_job
    ADD CONSTRAINT act_fk_deadletter_job_process_instance FOREIGN KEY (process_instance_id_) REFERENCES public.act_ru_execution(id_);
 f   ALTER TABLE ONLY public.act_ru_deadletter_job DROP CONSTRAINT act_fk_deadletter_job_process_instance;
       public          postgres    false    276    269    4033            ?           2606    58824 %   act_ru_event_subscr act_fk_event_exec    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_event_subscr
    ADD CONSTRAINT act_fk_event_exec FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);
 O   ALTER TABLE ONLY public.act_ru_event_subscr DROP CONSTRAINT act_fk_event_exec;
       public          postgres    false    259    4033    276                       2606    58687 "   act_ru_execution act_fk_exe_parent    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_parent FOREIGN KEY (parent_id_) REFERENCES public.act_ru_execution(id_);
 L   ALTER TABLE ONLY public.act_ru_execution DROP CONSTRAINT act_fk_exe_parent;
       public          postgres    false    4033    276    276                        2606    58699 #   act_ru_execution act_fk_exe_procdef    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);
 M   ALTER TABLE ONLY public.act_ru_execution DROP CONSTRAINT act_fk_exe_procdef;
       public          postgres    false    277    4035    276            !           2606    58681 $   act_ru_execution act_fk_exe_procinst    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);
 N   ALTER TABLE ONLY public.act_ru_execution DROP CONSTRAINT act_fk_exe_procinst;
       public          postgres    false    276    4033    276            "           2606    58693 !   act_ru_execution act_fk_exe_super    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_execution
    ADD CONSTRAINT act_fk_exe_super FOREIGN KEY (super_exec_) REFERENCES public.act_ru_execution(id_);
 K   ALTER TABLE ONLY public.act_ru_execution DROP CONSTRAINT act_fk_exe_super;
       public          postgres    false    4033    276    276                       2606    58562 5   act_ru_external_job act_fk_external_job_custom_values    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_external_job
    ADD CONSTRAINT act_fk_external_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);
 _   ALTER TABLE ONLY public.act_ru_external_job DROP CONSTRAINT act_fk_external_job_custom_values;
       public          postgres    false    233    3841    271                       2606    58557 1   act_ru_external_job act_fk_external_job_exception    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_external_job
    ADD CONSTRAINT act_fk_external_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);
 [   ALTER TABLE ONLY public.act_ru_external_job DROP CONSTRAINT act_fk_external_job_exception;
       public          postgres    false    233    3841    271            ?           2606    58717 '   act_ru_identitylink act_fk_idl_procinst    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_idl_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);
 Q   ALTER TABLE ONLY public.act_ru_identitylink DROP CONSTRAINT act_fk_idl_procinst;
       public          postgres    false    255    276    4033            #           2606    58848 $   act_procdef_info act_fk_info_json_ba    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_procdef_info
    ADD CONSTRAINT act_fk_info_json_ba FOREIGN KEY (info_json_id_) REFERENCES public.act_ge_bytearray(id_);
 N   ALTER TABLE ONLY public.act_procdef_info DROP CONSTRAINT act_fk_info_json_ba;
       public          postgres    false    280    3841    233            $           2606    58854 $   act_procdef_info act_fk_info_procdef    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_procdef_info
    ADD CONSTRAINT act_fk_info_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);
 N   ALTER TABLE ONLY public.act_procdef_info DROP CONSTRAINT act_fk_info_procdef;
       public          postgres    false    4035    277    280                       2606    58522 #   act_ru_job act_fk_job_custom_values    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);
 M   ALTER TABLE ONLY public.act_ru_job DROP CONSTRAINT act_fk_job_custom_values;
       public          postgres    false    233    3841    266                       2606    58517    act_ru_job act_fk_job_exception    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);
 I   ALTER TABLE ONLY public.act_ru_job DROP CONSTRAINT act_fk_job_exception;
       public          postgres    false    3841    233    266                       2606    58753    act_ru_job act_fk_job_execution    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_execution FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);
 I   ALTER TABLE ONLY public.act_ru_job DROP CONSTRAINT act_fk_job_execution;
       public          postgres    false    276    4033    266                       2606    58765    act_ru_job act_fk_job_proc_def    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_proc_def FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);
 H   ALTER TABLE ONLY public.act_ru_job DROP CONSTRAINT act_fk_job_proc_def;
       public          postgres    false    4035    266    277            	           2606    58759 &   act_ru_job act_fk_job_process_instance    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_job
    ADD CONSTRAINT act_fk_job_process_instance FOREIGN KEY (process_instance_id_) REFERENCES public.act_ru_execution(id_);
 P   ALTER TABLE ONLY public.act_ru_job DROP CONSTRAINT act_fk_job_process_instance;
       public          postgres    false    266    276    4033            ?           2606    58276 #   act_id_membership act_fk_memb_group    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_fk_memb_group FOREIGN KEY (group_id_) REFERENCES public.act_id_group(id_);
 M   ALTER TABLE ONLY public.act_id_membership DROP CONSTRAINT act_fk_memb_group;
       public          postgres    false    243    3860    242            ?           2606    58282 "   act_id_membership act_fk_memb_user    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_id_membership
    ADD CONSTRAINT act_fk_memb_user FOREIGN KEY (user_id_) REFERENCES public.act_id_user(id_);
 L   ALTER TABLE ONLY public.act_id_membership DROP CONSTRAINT act_fk_memb_user;
       public          postgres    false    3866    244    243                       2606    58842 $   act_re_model act_fk_model_deployment    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_re_model
    ADD CONSTRAINT act_fk_model_deployment FOREIGN KEY (deployment_id_) REFERENCES public.act_re_deployment(id_);
 N   ALTER TABLE ONLY public.act_re_model DROP CONSTRAINT act_fk_model_deployment;
       public          postgres    false    4019    275    274                       2606    58830     act_re_model act_fk_model_source    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_re_model
    ADD CONSTRAINT act_fk_model_source FOREIGN KEY (editor_source_value_id_) REFERENCES public.act_ge_bytearray(id_);
 J   ALTER TABLE ONLY public.act_re_model DROP CONSTRAINT act_fk_model_source;
       public          postgres    false    233    275    3841                       2606    58836 &   act_re_model act_fk_model_source_extra    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_re_model
    ADD CONSTRAINT act_fk_model_source_extra FOREIGN KEY (editor_source_extra_value_id_) REFERENCES public.act_ge_bytearray(id_);
 P   ALTER TABLE ONLY public.act_re_model DROP CONSTRAINT act_fk_model_source_extra;
       public          postgres    false    233    275    3841            ?           2606    58288 '   act_id_priv_mapping act_fk_priv_mapping    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_id_priv_mapping
    ADD CONSTRAINT act_fk_priv_mapping FOREIGN KEY (priv_id_) REFERENCES public.act_id_priv(id_);
 Q   ALTER TABLE ONLY public.act_id_priv_mapping DROP CONSTRAINT act_fk_priv_mapping;
       public          postgres    false    3872    247    248                       2606    58542 7   act_ru_suspended_job act_fk_suspended_job_custom_values    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);
 a   ALTER TABLE ONLY public.act_ru_suspended_job DROP CONSTRAINT act_fk_suspended_job_custom_values;
       public          postgres    false    3841    268    233                       2606    58537 3   act_ru_suspended_job act_fk_suspended_job_exception    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);
 ]   ALTER TABLE ONLY public.act_ru_suspended_job DROP CONSTRAINT act_fk_suspended_job_exception;
       public          postgres    false    268    233    3841                       2606    58789 3   act_ru_suspended_job act_fk_suspended_job_execution    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_execution FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);
 ]   ALTER TABLE ONLY public.act_ru_suspended_job DROP CONSTRAINT act_fk_suspended_job_execution;
       public          postgres    false    268    276    4033                       2606    58801 2   act_ru_suspended_job act_fk_suspended_job_proc_def    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_proc_def FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);
 \   ALTER TABLE ONLY public.act_ru_suspended_job DROP CONSTRAINT act_fk_suspended_job_proc_def;
       public          postgres    false    4035    277    268                       2606    58795 :   act_ru_suspended_job act_fk_suspended_job_process_instance    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_suspended_job
    ADD CONSTRAINT act_fk_suspended_job_process_instance FOREIGN KEY (process_instance_id_) REFERENCES public.act_ru_execution(id_);
 d   ALTER TABLE ONLY public.act_ru_suspended_job DROP CONSTRAINT act_fk_suspended_job_process_instance;
       public          postgres    false    4033    276    268            ?           2606    58723    act_ru_task act_fk_task_exe    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);
 E   ALTER TABLE ONLY public.act_ru_task DROP CONSTRAINT act_fk_task_exe;
       public          postgres    false    276    4033    260                        2606    58735    act_ru_task act_fk_task_procdef    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_procdef FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);
 I   ALTER TABLE ONLY public.act_ru_task DROP CONSTRAINT act_fk_task_procdef;
       public          postgres    false    277    4035    260                       2606    58729     act_ru_task act_fk_task_procinst    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_task
    ADD CONSTRAINT act_fk_task_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);
 J   ALTER TABLE ONLY public.act_ru_task DROP CONSTRAINT act_fk_task_procinst;
       public          postgres    false    260    276    4033            
           2606    58532 /   act_ru_timer_job act_fk_timer_job_custom_values    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_custom_values FOREIGN KEY (custom_values_id_) REFERENCES public.act_ge_bytearray(id_);
 Y   ALTER TABLE ONLY public.act_ru_timer_job DROP CONSTRAINT act_fk_timer_job_custom_values;
       public          postgres    false    233    3841    267                       2606    58527 +   act_ru_timer_job act_fk_timer_job_exception    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_exception FOREIGN KEY (exception_stack_id_) REFERENCES public.act_ge_bytearray(id_);
 U   ALTER TABLE ONLY public.act_ru_timer_job DROP CONSTRAINT act_fk_timer_job_exception;
       public          postgres    false    267    233    3841                       2606    58771 +   act_ru_timer_job act_fk_timer_job_execution    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_execution FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);
 U   ALTER TABLE ONLY public.act_ru_timer_job DROP CONSTRAINT act_fk_timer_job_execution;
       public          postgres    false    267    276    4033                       2606    58783 *   act_ru_timer_job act_fk_timer_job_proc_def    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_proc_def FOREIGN KEY (proc_def_id_) REFERENCES public.act_re_procdef(id_);
 T   ALTER TABLE ONLY public.act_ru_timer_job DROP CONSTRAINT act_fk_timer_job_proc_def;
       public          postgres    false    277    4035    267                       2606    58777 2   act_ru_timer_job act_fk_timer_job_process_instance    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_timer_job
    ADD CONSTRAINT act_fk_timer_job_process_instance FOREIGN KEY (process_instance_id_) REFERENCES public.act_ru_execution(id_);
 \   ALTER TABLE ONLY public.act_ru_timer_job DROP CONSTRAINT act_fk_timer_job_process_instance;
       public          postgres    false    267    276    4033            ?           2606    58705 &   act_ru_identitylink act_fk_tskass_task    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_identitylink
    ADD CONSTRAINT act_fk_tskass_task FOREIGN KEY (task_id_) REFERENCES public.act_ru_task(id_);
 P   ALTER TABLE ONLY public.act_ru_identitylink DROP CONSTRAINT act_fk_tskass_task;
       public          postgres    false    260    3933    255                       2606    58437 $   act_ru_variable act_fk_var_bytearray    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_bytearray FOREIGN KEY (bytearray_id_) REFERENCES public.act_ge_bytearray(id_);
 N   ALTER TABLE ONLY public.act_ru_variable DROP CONSTRAINT act_fk_var_bytearray;
       public          postgres    false    264    3841    233                       2606    58741    act_ru_variable act_fk_var_exe    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_exe FOREIGN KEY (execution_id_) REFERENCES public.act_ru_execution(id_);
 H   ALTER TABLE ONLY public.act_ru_variable DROP CONSTRAINT act_fk_var_exe;
       public          postgres    false    4033    264    276                       2606    58747 #   act_ru_variable act_fk_var_procinst    FK CONSTRAINT     ?   ALTER TABLE ONLY public.act_ru_variable
    ADD CONSTRAINT act_fk_var_procinst FOREIGN KEY (proc_inst_id_) REFERENCES public.act_ru_execution(id_);
 M   ALTER TABLE ONLY public.act_ru_variable DROP CONSTRAINT act_fk_var_procinst;
       public          postgres    false    276    264    4033            ?           2606    58122 ,   bpm_user_group_role fk_bpm_ugr_on_user_group    FK CONSTRAINT     ?   ALTER TABLE ONLY public.bpm_user_group_role
    ADD CONSTRAINT fk_bpm_ugr_on_user_group FOREIGN KEY (user_group_id) REFERENCES public.bpm_user_group(id);
 V   ALTER TABLE ONLY public.bpm_user_group_role DROP CONSTRAINT fk_bpm_ugr_on_user_group;
       public          postgres    false    226    3823    227            ?           2606    58127 ,   bpm_user_group_user fk_bpm_ugu_on_user_group    FK CONSTRAINT     ?   ALTER TABLE ONLY public.bpm_user_group_user
    ADD CONSTRAINT fk_bpm_ugu_on_user_group FOREIGN KEY (user_group_id) REFERENCES public.bpm_user_group(id);
 V   ALTER TABLE ONLY public.bpm_user_group_user DROP CONSTRAINT fk_bpm_ugu_on_user_group;
       public          postgres    false    226    228    3823            ?           2606    58159 $   d_customer fk_d_customer_on_category    FK CONSTRAINT     ?   ALTER TABLE ONLY public.d_customer
    ADD CONSTRAINT fk_d_customer_on_category FOREIGN KEY (category_id) REFERENCES public.d_category(id);
 N   ALTER TABLE ONLY public.d_customer DROP CONSTRAINT fk_d_customer_on_category;
       public          postgres    false    3834    231    230            ?           2606    58074 )   report_execution fk_report_exec_to_report    FK CONSTRAINT     ?   ALTER TABLE ONLY public.report_execution
    ADD CONSTRAINT fk_report_exec_to_report FOREIGN KEY (report_id) REFERENCES public.report_report(id);
 S   ALTER TABLE ONLY public.report_execution DROP CONSTRAINT fk_report_exec_to_report;
       public          postgres    false    3809    224    222            ?           2606    58060 ,   report_template fk_report_template_to_report    FK CONSTRAINT     ?   ALTER TABLE ONLY public.report_template
    ADD CONSTRAINT fk_report_template_to_report FOREIGN KEY (report_id) REFERENCES public.report_report(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.report_template DROP CONSTRAINT fk_report_template_to_report;
       public          postgres    false    222    3809    223            ?           2606    58055 '   report_report fk_report_to_def_template    FK CONSTRAINT     ?   ALTER TABLE ONLY public.report_report
    ADD CONSTRAINT fk_report_to_def_template FOREIGN KEY (default_template_id) REFERENCES public.report_template(id);
 Q   ALTER TABLE ONLY public.report_report DROP CONSTRAINT fk_report_to_def_template;
       public          postgres    false    223    222    3813            ?           2606    58037 '   report_report fk_report_to_report_group    FK CONSTRAINT     ?   ALTER TABLE ONLY public.report_report
    ADD CONSTRAINT fk_report_to_report_group FOREIGN KEY (group_id) REFERENCES public.report_group(id);
 Q   ALTER TABLE ONLY public.report_report DROP CONSTRAINT fk_report_to_report_group;
       public          postgres    false    3805    221    222            ?           2606    57978 &   sec_resource_policy fk_res_policy_role    FK CONSTRAINT     ?   ALTER TABLE ONLY public.sec_resource_policy
    ADD CONSTRAINT fk_res_policy_role FOREIGN KEY (role_id) REFERENCES public.sec_resource_role(id);
 P   ALTER TABLE ONLY public.sec_resource_policy DROP CONSTRAINT fk_res_policy_role;
       public          postgres    false    216    214    3789            ?           2606    57991 -   sec_row_level_policy fk_row_level_policy_role    FK CONSTRAINT     ?   ALTER TABLE ONLY public.sec_row_level_policy
    ADD CONSTRAINT fk_row_level_policy_role FOREIGN KEY (role_id) REFERENCES public.sec_row_level_role(id);
 W   ALTER TABLE ONLY public.sec_row_level_policy DROP CONSTRAINT fk_row_level_policy_role;
       public          postgres    false    215    217    3792                       2606    58599 *   flw_ru_batch_part flw_fk_batch_part_parent    FK CONSTRAINT     ?   ALTER TABLE ONLY public.flw_ru_batch_part
    ADD CONSTRAINT flw_fk_batch_part_parent FOREIGN KEY (batch_id_) REFERENCES public.flw_ru_batch(id_);
 T   ALTER TABLE ONLY public.flw_ru_batch_part DROP CONSTRAINT flw_fk_batch_part_parent;
       public          postgres    false    4014    272    273            ?     x???]o?0??ͯ?(??cS??B?E???T??J??R ?k~h??*$˶||??{b???.?-?KTm?XVOƖ??W뾷?r??qi????֑??]?ˬ????U?(???i넰??z?+?%"(?OGwy:Fj?`????B`?#?Ҡ?? ?	f??Kɶ??f?Gy1????f2?y?N????;?yz;?????)??6?M?|x5Iz?"?#???Y݄?X?Zu(z??????m??!jn)?`?Ge?<0?X/?UGT???g۟Z???3?)?8bm<????;ge?ʛ??+@#???*W????3?iR/#ަ??????PM՜b`??e??o?߯xn7??n???x[u???????<??BP?D?\r????\???????1ji?ůe??}xN?M?????"??w????????(??l?S"?:F0@*Q?t?և?,`???4ؗ?&?????_???Ä??*????󎘲?8z??v?3???"AێF{S?eb??B ?H}Č|_>???t:/?W+?      ?      x?3?L???"?=... U?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?   ?   x???A?0E??ItAF\?eܴi?(?N?2p{?ö?2?????0	;??np?+\T?=MβSm?ؑ??g??g?r?b?lF?
?? &?,Mdc{??`??????@?IB?F2B???????D??rM??p??^Ôً??isז???????      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?   &   x?+N?H?M?+K-*????4?3?3?3?4?????? ???      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?   I   x?33??0??0?5L23?5121׵4I6?MIK36?061O?4?4?LL????????????Z?H	??????? ?n?      ?   |  x???[S?Xǟ?O??c8????>?P???evR5U?s?xlƘ???o?[,?|IL? ?V[ҿ?O??%?????[?b2;??????ݤz{|5??n??m:???t5?r??͏?^_Ȑ???= ???{n??Ya????g?=uN?>y묕I?d5B??E)K?̒a??"???J??o?]?????3u{gE?W?G G?ڢi?RK??p??.??,?z?B??5?	 ?c0):f??f	????Πl?{??g??ɨ???????G ]?e=?G???,??R3.0k?y?Q?U?blϮ??F?]?D?U!?՘(#???(<Hz??J????r5?iJ????[?ߩY???Ã?U?????????=?$g???%? ?r4^8?\?,$*???֮9?G'?;???3??F???+?y?B?)??'?ouYO??W?j?D??????g?A(???R?Gg??????N?$q????)??·?5???????:??-?y?????ow?ml)'?a??wA?X_([7??ŗy???????е?$?S4? ???By????@~Iw?׃I??^h???zH?q?l???
?k!?Q?0ˎ??j???.+#ӘeJ??R????[퉚Ɇ?????dT~??~ń?<z˘s?I?C??P??ٳ???淓?E?.J????v????;??6#???eq\;)E?
2C?D??#1z??d???(;?fۇ?,J)??\xn5?Ny? ??M?PR&i?v.x???-?qJL$i5$? M?Is?+j?)'???2????h?]眧??|q????}??|??,?r?T5dP$?<-=!??6>F?????I??e0*???eS?z?yx?`4?\\???2??l?&_???o???v1w????<Z}?Ã?lw???o??q??i????	?r"?)?:X????6E?!QM4@?7C֜WK N??A)2O??"?g7?*|?Qʷ?(?*N}?퇣o??|?	ָ-?N?????;g??P?LDg?t?b?W?wr?y?㗃n?ݽ<9??b?Z7n????Ҁ?BS??d?<?Lp??O??9?=gka???$B??^R?9???½??x??WTy?.?pQ??1f???(? b#????&?????!???IoD????~?%?$?EÈ-j???D??DjN^???K'O?K???.y|???Úi??;?`?YA?W	S@????T?&??#O?$܈Q???m?b;??????FY?U???????ǈ^X??aWR.?gq???܌?ݤ????.ǣ???W??Fh??l?w????Q7߬?#?P`+3Db??1?????,?@??Y?y?}B??
??G=???Y!m7&6?kVFM??U*
??1? JgH[??B??7D//?;K???r8?N?oBT?? ????Vk?j?0?67?????_*В'?p?i%?3?gE#6 ?ړg?f????????y??6_?-6??^Trd?2????q?????J>???x%?Ǭ???W|Jߛ??~o?z5I??!?	?4?`?(`0?$?Q?fX???g????c?6?=4޿???:??C?1?!??4?)???.
IY???S?IEn???W֜&?劳?f͍??6?q??(?jdj?@?3?bL?
$?Ek??Ǉy???e?S?X?	:?Ɲ??C??!&?1
???Ndac?????z? ???$wO񵄐X?~?:Y;?h:w?@?!$$)??w??(w]?1]?ȿ??c??q?o?????5?N???4o??Apg????8	????r??1??S?blz\r??R|(?P?"f? ??????$!?uy????~??????B'W???c??:??RGͽ??q?򝹉???L阋W>4??ܧ?@?d?Ry]"Mq?1?$O?@??L
E4.?V??9?
???5??-?V??3ۢJ????L^?3????	U=??A?'?:?B?h$??MB?B????q?OF????s?-sm-b?
?N??XVzj???F?L:?&?N?{?]1x?4֐?1??E=-_??o???I/x?Xb??(Q??`??>?eH??$??xJ??p?+>Ԛ??????R??t???P֐'f????K???D>??p$ ????>??Y???ho{???7V???騘??*????{???6=H      ?      x?3?L???"?=... U?      ?      x?????? ? ?      ?   h  x???mKA?????Н{?r?k?AΕ?,;?@?}M8=ҳ??wZ?Ah??e??????$/޴??ic_4????U?|o8??g/???+?f?_???g??b
y1?7?L????e=?M̚??$?"?(@j??A??H4?-V?I$7I?D(4	I?B!?]B??Y/?1?s??t??A?ٸ?n????*???b???7???4?V?$M?????d?`S?m??m??8i?? M?.??????u+MU???}?Q??>?f????0???9??(eL rx:Z>#?E?s1??G?QN??N#?\\????آ_Z???Bϫ?2)A?P??")??k ??QZ}}l?? ȮWe1?w͏.3?k???z?      ?      x?3?L???"?=... U?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?   t   x?U?1?  ?ټ?0?1M!R?l2g?b?J)?P??.]*?v^)?])?2+c̞q?%%Ϲ????$?o,#?Q??@*?w?u?3iӞ6X???9??:lњ??m?_??c?}[#H      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?   W   x?]???0 ?3??i+???xA???OR????}yY???\?X9Q?;&B*f?C?B?i????N??o;h}??D?ܡ?_OUéA??r?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?      ?      x?????? ? ?     