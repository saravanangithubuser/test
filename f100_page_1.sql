prompt --application/set_environment
set define off verify off feedback off
whenever sqor exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_190200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2019.10.04'
,p_release=>'19.2.0.00.18'
,p_default_workspace_id=>1000000
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'ORACLE_CSC'
);
end;
/
 
prompt APPLICATION 100 - Sample Application
--
-- Application Export:
--   Application:     100
--   Name:            Sample Application
--   Date and Time:   12:49 Monday January 27, 2020
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 1
--   Manifest End
--   Version:         19.2.0.00.18
--   Instance ID:     300156330803229
--

begin
null;
end;
/
prompt --application/pages/delete_00001
begin
wwv_flow_api.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>1);
end;
/
prompt --application/pages/page_00001
begin
wwv_flow_api.create_page(
 p_id=>1
,p_user_interface_id=>wwv_flow_api.id(400162635807560)
,p_tab_set=>'TS1'
,p_name=>'Sample Application'
,p_step_title=>'Oracle Sample Application'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<script language="JavaScript" type="text/javascript">',
'<!--',
'',
'function openGroupPopup(sourceUrl)',
'{',
'     var returnvalue ;',
'  if ( document.getElementById("P1_LOGIN_GROUP_ID").value == '''' ) ',
'  {',
'     if (window.showModalDialog) {',
'       returnvalue = window.showModalDialog (sourceUrl,window,"dialogHeight : 250px;dialogWidth : 500px;center : yes") ;',
'document.getElementById("P1_LOGIN_GROUP_ID").value = returnvalue.GROUP_ID ;',
'//alert(returnvalue.GROUP_ID );',
'doSubmit(''Submit'');',
'}',
'else',
'{',
'     window.open(sourceUrl,"APEX_GROUPWIN","height:200px;width:400px") ;',
'}',
'}',
'}',
'',
'//-->',
'</script>',
'',
'<style>',
'.rounded-corner-region .rc-body-r { height: 170px !important; }',
'</style>'))
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This is the Home Page of the Sample Application.  It is intended to be a sales dashboard of sorts - displaying some metrics which are derived in real-time from the database.',
'<p>',
'The <strong>My Quota</strong> region is a Flash chart type called  Dial Chart.  It is dynamically rendered based on a SQL Statement each time the page is viewed.  <strong>My Top Orders</strong> displays the top five orders for the currently signed in'
||' user, based on order total.  The <strong>Tasks</strong> region is an example of using a List to provide easy navigation to common tasks.'))
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20200127124512'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(829227880382692670)
,p_plug_name=>'Sample Application'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(833686160253191783)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>'Welcome to the Sample Application.  This application is designed to highlight the features of Oracle Application Express.'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(829234654671704188)
,p_plug_name=>'Tasks'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(833686437910191784)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'BELOW'
,p_list_id=>wwv_flow_api.id(791192977040343438)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_api.id(833691160079191804)
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(830776352404728728)
,p_name=>'Top Customers'
,p_template=>wwv_flow_api.id(833685245568191780)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:49%; float:left; clear: none;"'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT b.cust_last_name || '', '' || b.cust_first_name ',
'|| '' - ''|| count(a.order_id) ||'' Order(s)'' customer_name ',
', SUM(a.ORDER_TOTAL) order_total,  b.customer_id id',
'FROM demo_orders a, DEMO_CUSTOMERS b',
'WHERE a.customer_id = b.customer_id',
'GROUP BY b.customer_id, b.cust_last_name || '', '' || b.cust_first_name',
'ORDER BY NVL(SUM(a.ORDER_TOTAL),0) DESC'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(833695049512191821)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>7
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>7
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(830778029248750365)
,p_query_column_id=>1
,p_column_alias=>'CUSTOMER_NAME'
,p_column_display_sequence=>2
,p_column_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_CUSTOMER_ID:#ID#'
,p_column_linktext=>'#CUSTOMER_NAME#'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(830776844318728794)
,p_query_column_id=>2
,p_column_alias=>'ORDER_TOTAL'
,p_column_display_sequence=>1
,p_column_format=>'FML999G999G999G999G990D00'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(830778156452750366)
,p_query_column_id=>3
,p_column_alias=>'ID'
,p_column_display_sequence=>3
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(830778441153763329)
,p_name=>'Top Products'
,p_template=>wwv_flow_api.id(833685245568191780)
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:49%; float:left; margin-right: 1%;"'
,p_new_grid_row=>false
,p_new_grid_column=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select p.product_name||'' - ''||SUM(oi.quantity)||'' x ''||to_char(p.list_price,''L999G99'')||'''' product,',
'       SUM(oi.quantity * oi.unit_price) sales,  p.product_id',
'from demo_order_items oi',
',    demo_product_info p',
'where oi.product_id = p.product_id',
'group by p.Product_id, p.product_name, p.list_price',
'order by 2 desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(833695049512191821)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>7
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>7
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(830779048080765315)
,p_query_column_id=>1
,p_column_alias=>'PRODUCT'
,p_column_display_sequence=>2
,p_column_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_PRODUCT_ID:#PRODUCT_ID#'
,p_column_linktext=>'#PRODUCT#'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(830779157087765315)
,p_query_column_id=>2
,p_column_alias=>'SALES'
,p_column_display_sequence=>1
,p_column_format=>'FML999G999G999G999G990D00'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(833800160524112272)
,p_query_column_id=>4
,p_column_alias=>'PRODUCT_ID'
,p_column_display_sequence=>3
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(833606649162888621)
,p_plug_name=>'Sales Quota'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>' style="width:49%; float:left; margin-right: 1%;"'
,p_plug_template=>wwv_flow_api.id(833685245568191780)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"',
'    codebase="#HOST_PROTOCOL#://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"',
'    width="#WIDTH#"',
'    height="#HEIGHT#"',
'    id="#CHART_NAME#"',
'    align="top">',
'<param name="movie" value="#IMAGE_PREFIX#flashchart/anychart_5/swf/#CHART_TYPE#.swf?XMLFile=#HOST#apex_util.flash?p=&APP_ID.:1:&APP_SESSION.:FLOW_FLASH_CHART5_R#REGION_ID#">',
'<param name="quality" value="high">',
'<param name="allowScriptAccess" value="sameDomain">',
'<param name="allowNetworking" value="all">',
'<param name="scale" value="noscale">',
'<param name="wmode" value="transparent">',
'<param name="FlashVars" value="initText=#FLASH_INIT#&xmlLoadingText=#FLASH_LOADING#&resourcesLoadingText=#FLASH_RESOURCES#&noDataText=#FLASH_NO_DATA#&waitingForDataText=#FLASH_WAITING#&templatesLoadingText=#FLASH_TEMPLATES#">',
'',
'<embed src="#IMAGE_PREFIX#flashchart/anychart_5/swf/#CHART_TYPE#.swf?XMLFile=#HOST#apex_util.flash?p=&APP_ID.:1:&APP_SESSION.:FLOW_FLASH_CHART5_R#REGION_ID#"',
'       quality="high"',
'       width="#WIDTH#"',
'       height="#HEIGHT#"',
'       name="#CHART_NAME#"',
'       scale="noscale"',
'       align=""',
'       allowScriptAccess="sameDomain" ',
'       allowNetworking="all"',
'       type="application/x-shockwave-flash"',
'       pluginspage="#HOST_PROTOCOL#://www.macromedia.com/go/getflashplayer"',
'       wmode="transparent"',
'       FlashVars="initText=#FLASH_INIT#&xmlLoadingText=#FLASH_LOADING#&resourcesLoadingText=#FLASH_RESOURCES#&noDataText=#FLASH_NO_DATA#&waitingForDataText=#FLASH_WAITING#&templatesLoadingText=#FLASH_TEMPLATES#">',
'</embed>',
'</object>',
'#CHART_REFRESH#'))
,p_plug_source_type=>'NATIVE_FLASH_CHART5'
,p_plug_required_role=>'!'||wwv_flow_api.id(819293978645584857)
,p_plug_header=>'My sales measured against quota'
);
wwv_flow_api.create_flash_chart5(
 p_id=>wwv_flow_api.id(833606846205888627)
,p_default_chart_type=>'GaugeChart'
,p_chart_rendering=>'FLASH_PREFERRED'
,p_chart_name=>'chart_828829718297717919'
,p_chart_width=>300
,p_chart_height=>180
,p_chart_animation=>'N'
,p_display_attr=>':::V:X:N:N:::Y:None:::N:::Default'
,p_dial_tick_attr=>'T:::Auto:needle:2:1:90:180::Inside:'
,p_gantt_attr=>'Y:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:Rhomb:Rhomb:Full:30:15:5:Y:I:N:S:E'
,p_map_attr=>'Orthographic:RegionBounds:REGION_NAME'
,p_margins=>'-20:::'
, p_omit_label_interval=> null
,p_bgtype=>'Trans'
,p_color_scheme=>'1'
,p_x_axis_label_font=>'::'
,p_y_axis_label_font=>'::'
, p_names_font=> null
, p_names_rotation=> null
,p_hints_font=>'Tahoma:10:'
,p_chart_title_font=>'Tahoma:14:#000000'
,p_x_axis_title_font=>'Tahoma:14:'
,p_y_axis_title_font=>'Tahoma:14:'
,p_gauge_labels_font=>'Tahoma:10:#000000'
,p_use_chart_xml=>'N'
);
wwv_flow_api.create_flash_chart5_series(
 p_id=>wwv_flow_api.id(833606955973888638)
,p_chart_id=>wwv_flow_api.id(833606846205888627)
,p_series_seq=>10
,p_series_name=>'Series 1'
,p_series_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select order_total, quota, 0, order_total',
'from (select (select sum(o.order_total) order_total ',
'                from demo_orders o, ',
'                     demo_users u ',
'               where o.user_id = u.user_id ',
'                 and u.user_name = :APP_USER) order_total, ',
'             u.quota',
'      from demo_users u',
'      where u.user_name = :APP_USER)'))
,p_series_query_type=>'SQL_QUERY'
,p_series_query_parse_opt=>'PARSE_CHART_QUERY'
,p_series_query_no_data_found=>'No sales found for current user.'
,p_series_query_row_count_max=>15
,p_show_action_link=>'N'
);
wwv_flow_api.create_report_region(
 p_id=>wwv_flow_api.id(833607242020895967)
,p_name=>'Top Orders by Date'
,p_template=>wwv_flow_api.id(833685245568191780)
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:49%; float:left; clear: none;"'
,p_new_grid_row=>false
,p_display_column=>1
,p_display_point=>'BODY_3'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select o.order_timestamp order_day,',
'       SUM(o.order_total) sales',
'from demo_orders o',
'group by o.order_timestamp',
'order by 2 desc',
''))
,p_display_condition_type=>'NEVER'
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_query_row_template=>wwv_flow_api.id(833695049512191821)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>7
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'no data found'
,p_query_num_rows_type=>'0'
,p_query_row_count_max=>7
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(833607539812895981)
,p_query_column_id=>2
,p_column_alias=>'SALES'
,p_column_display_sequence=>1
,p_column_format=>'FML999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_lov_show_nulls=>'NO'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_api.create_report_columns(
 p_id=>wwv_flow_api.id(833800542647116633)
,p_query_column_id=>3
,p_column_alias=>'ORDER_DAY'
,p_column_display_sequence=>2
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(833923328616141662)
,p_plug_name=>'Sales Quota'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="width:49%; float:left; margin-right: 1%;"'
,p_plug_template=>wwv_flow_api.id(833685245568191780)
,p_plug_display_sequence=>11
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_display_column=>1
,p_plug_display_point=>'BODY_3'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_required_role=>wwv_flow_api.id(819293978645584857)
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>'Admins have no quota'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
,p_attribute_03=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(830779945225783394)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(830776352404728728)
,p_button_name=>'VIEW_CUSTOMERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(400383139807579)
,p_button_image_alt=>'View Customers'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'#IMAGE_PREFIX#menu/go-small.png'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(833621247721134172)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(830778441153763329)
,p_button_name=>'VIEW_PRODUCTS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(400383139807579)
,p_button_image_alt=>'View Products'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'#IMAGE_PREFIX#menu/go-small.png'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(833618351268116240)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(833607242020895967)
,p_button_name=>'VIEW_ORDERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(400383139807579)
,p_button_image_alt=>'View Orders'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_button_css_classes=>'#IMAGE_PREFIX#menu/go-small.png'
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
