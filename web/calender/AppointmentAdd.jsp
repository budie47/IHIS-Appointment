<%-- 
    Document   : CIS040000
    Created on : Feb 18, 2017, 12:26:03 PM
    Author     : shay
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dBConn.Conn"%>
<%@page import="main.RMIConnector"%>
<!--Modal add Procedure-->
<%
    Conn Conn = new Conn();
    String hfc_cd = (String) session.getAttribute("HEALTH_FACILITY_CODE");

    String username = (String) session.getAttribute("username");
    String hfc = (String) session.getAttribute("HEALTH_FACILITY_CODE");
    String name = (String) session.getAttribute("USER_NAME");
    String title = (String) session.getAttribute("OCCUPATION_CODE");
    String discipline = (String) session.getAttribute("DISCIPLINE_CODE");
    String subdiscipline = (String) session.getAttribute("SUBDISCIPLINE_CODE");

%>
<div class="modal fade" id="AppointmentAdd" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal"><i class="fa fa-times fa-lg"></i><span class="sr-only">Close</span></button>
                <h3 class="modal-title" id="lineModalLabel">Make Appointment</h3>
            </div>
            <div class="modal-header" style="padding: 0px;">

            </div>
            <div class="modal-body">
                <div class="tabbable-panel">
                    <div class="tabbable-line">
                        <!-- tab content -->
                        <div class="tab-content">

                            <div class="form-horizontal">
                                <h4 class="modal-title" style="font-weight: bold">Search Patient</h4>

                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group" >
                                            <label class="  col-md-12" for="textinput" >Search Type</label>
                                            <div class="col-md-12">
                                                <select class="form-control input-lg" id="select_TYPE_SEARCH_PATIENT" name="select_TYPE_SEARCH_PATIENT">
                                                    <option value="IC">Identification Card Number / IC No</option>
                                                    <option value="PMI">PMI Number</option>
                                                    <option value="ID">ID Number / Matric / Staff Number</option>
                                                </select>
                                            </div>
                                        </div> 
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group form-inline" >
                                            <label class="  col-md-12" for="textinput" >&nbsp;</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text"  id="t_SEARCH_PMI_NO" placeholder="Enter PMI Number Here" style="width: 82%;">
                                                <input class="form-control input-lg" type="text"  id="t_SEARCH_IC_NO" placeholder="Enter IC Number Here" style="width: 82%;" >
                                                <input class="form-control input-lg" type="text"  id="t_SEARCH_ID_NO" placeholder="Enter ID Number Here" style="width: 82%;" >
                                                <button class="btn btn-primary" id="t_SEARCH_Patient_ADD_Appointment" >Search</button>
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-4">
                                        <div class="form-group">

                                            <div class="col-md-12">

                                                <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_HFC_CD"   value="<%=hfc%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">

                                            <div class="col-md-12">

                                                <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_DIS_CODE"   value="<%=discipline%>">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="form-group">
                                            <div class="col-md-12">


                                                <input class="form-control input-lg" type="hidden"  id="t_ADD_Appointment_SUBDIS_CODE"  value="<%=subdiscipline%>">
                                            </div>
                                        </div>

                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-12"><h4 class="modal-title" style="font-weight: bold">Patient Detail</h4></div>
                                    <div class="col-md-6">


                                        <!-- content goes here -->
                                        <div class="form-group">

                                            <label class="col-md-12" for="textinput">Patient Name</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appointment_Patient_Name" readonly="">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="col-md-12" for="textinput">PMI Number</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appointment_PMI_NO" readonly="">
                                                <input class="form-control input-lg" type="hidden" name="problem"  id="t_ADD_Appointment_IC_NO" readonly="">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-3">
                                        <div class="form-group">
                                            <label class="col-md-12" for="textinput">ID Number</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appointment_ID_NO" readonly="">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <hr/>
                                <div class="row">
                                    <div class="col-md-12"><h4 class="modal-title" style="font-weight: bold">Appointment Detail</h4></div>
                                    <div class="col-md-6">


                                        <!-- content goes here -->
                                        <div class="form-group">

                                            <label class="col-md-12" for="textinput">Date</label>
                                            <div class="col-md-12">
                                                <input class="form-control input-lg" type="text" name="problem"  id="t_ADD_Appoinment_Date">

                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-12" for="textinput">Time</label>
                                            <div class="col-md-12">
                                                <div id="div_ADD_Appoinment_TIME"></div>
<!--                                                <select class="form-control input-lg" id="t_ADD_Appoinment_Time" name="appTime" required>
                                                    <option></option>
                                                    <option value="09:00:00"><%out.print("09:00:00");%></option>
                                                    <option value="09:15:00"><%out.print("09:15:00");%></option>
                                                    <option value="09:30:00"><%out.print("09:30:00");%></option>
                                                    <option value="09:45:00"><%out.print("09:45:00");%></option>
                                                    <option value="10:00:00"><%out.print("10:00:00");%></option>
                                                    <option value="10:15:00"><%out.print("10:15:00");%></option>
                                                    <option value="10:30:00"><%out.print("10:30:00");%></option>
                                                    <option value="10:35:00"><%out.print("10:35:00");%></option>
                                                    <option value="10:40:00"><%out.print("10:40:00");%></option>
                                                    <option value="10:45:00"><%out.print("10:45:00");%></option>
                                                    <option value="11:00:00"><%out.print("11:00:00");%></option>
                                                    <option value="11:15:00"><%out.print("11:15:00");%></option>
                                                    <option value="11:30:00"><%out.print("11:30:00");%></option>
                                                    <option value="11:45:00"><%out.print("11:45:00");%></option>
                                                    <option value="12:00:00"><%out.print("12:00:00");%></option>
                                                    <option value="12:15:00"><%out.print("12:15:00");%></option>
                                                    <option value="12:30:00"><%out.print("12:30:00");%></option>
                                                    <option value="12:45:00"><%out.print("12:45:00");%></option>
                                                    <option value="13:00:00"><%out.print("13:00:00");%></option>
                                                    <option value="13:15:00"><%out.print("13:15:00");%></option>
                                                    <option value="13:30:00"><%out.print("13:30:00");%></option>
                                                    <option value="13:45:00"><%out.print("13:45:00");%></option>
                                                    <option value="14:00:00"><%out.print("14:00:00");%></option>
                                                    <option value="14:15:00"><%out.print("14:15:00");%></option>
                                                    <option value="14:30:00"><%out.print("14:30:00");%></option>
                                                    <option value="14:45:00"><%out.print("14:45:00");%></option>
                                                    <option value="15:00:00"><%out.print("15:00:00");%></option>
                                                    <option value="15:15:00"><%out.print("15:15:00");%></option>
                                                    <option value="15:30:00"><%out.print("15:30:00");%></option>
                                                    <option value="15:45:00"><%out.print("15:45:00");%></option>
                                                    <option value="16:00:00"><%out.print("16:00:00");%></option>
                                                    <option value="16:15:00"><%out.print("16:15:00");%></option>
                                                    <option value="16:30:00"><%out.print("16:30:00");%></option>
                                                </select>-->

                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-12 " for="textinput">Doctor</label>
                                            <div class="col-md-12">
                                                <div id="div_ADD_Appoinment_Doctor"></div>


                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label class="col-md-12" for="textinput">Type</label>
                                            <div class="col-md-12">
                                                <select class="form-control input-lg" id="t_ADD_Appoinment_Type" name="appType" required>
                                                    <option></option>
                                                    <%
                                                        String sqlAppType = "SELECT `Description` FROM adm_lookup_detail WHERE `Master_Reference_code` = '0086' AND hfc_cd = '" + hfc_cd + "' ";
                                                        ArrayList<ArrayList<String>> dataAppType = Conn.getData(sqlAppType);

                                                        if (dataAppType.size() > 0) {
                                                            for (int i = 0; i < dataAppType.size(); i++) {%>
                                                    <option value="<%=dataAppType.get(i).get(0)%>"><%=dataAppType.get(i).get(0)%></option>
                                                    <% }
                                                        }
                                                    %>
                                                </select>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <!-- Tab 1 -->


                            <!-- Tab 2 -->

                        </div>
                    </div>
                </div>




            </div>

            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-success btn-block btn-lg" id="btn_ADD_Appoinment_ADD" role="button">Submit Orders</button>
                    </div>
                    <div class="btn-group btn-delete hidden" role="group">
                        <button type="button" id="delImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal"  role="button">Clear</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="saveImage" class="btn btn-default btn-block btn-lg" data-dismiss="modal" role="button">Close</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--End add Procedure-->

