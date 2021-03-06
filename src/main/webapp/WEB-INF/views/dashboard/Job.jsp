<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<%@ taglib prefix="datatables"
	uri="http://github.com/dandelion/datatables"%>
<!DOCTYPE html>
<html>

<%
	java.util.Date date = new java.util.Date();
%>
<jsp:include page="../fragments/headTag.jsp" />
<jsp:include page="../fragments/bodyHeader.jsp" />

<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Content Header (Page header) -->
	<section class="content-header">
		<h1>In Progress
			
			<small><spring:message code="job" /></small>
		</h1>
		<ol class="breadcrumb">
			<li class="active"><font color='blue'><b><%=date%></b></font></li>
		</ol>
	</section>
		<!-- Main content -->
	<section class="content">

		<div class="col-lg-3 col-md-6">
			<div class="panel panel-warning">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="glyphicon glyphicon-check"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">
								<h3>
									<c:set var="counter1" value="0" />
									<c:set var="abc" value="OPEN" />
									<c:forEach items="${plmDiagnose}" var="issue"
										varStatus="status">
										<c:if test="${abc eq issue.itemStatus}">
											<c:set var="counter1" value="${counter1 + 1}" />
										</c:if>
									</c:forEach>
									<font color='red'><b>8</b></font>
								</h3>
							</div>
							<div>Total Open Issues</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">
						<a data-toggle="modal" data-target="#openIssue"> More info </a></span> <span class="pull-right">
						<i class="glyphicon glyphicon-hand-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>

		<div class="col-lg-3 col-md-6">
			<div class="panel panel-success">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
							<i class="glyphicon glyphicon-new-window"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">
								<h3>
									<c:set var="counter1" value="0" />
									<c:set var="abc" value="CLOSED" />
									<c:forEach items="${plmDiagnose}" var="issue" varStatus="status">
									<c:if test="${abc eq issue.itemStatus}">
										<c:set var="counter1" value="${counter1 + 1}" />
										</c:if>
									</c:forEach>
										<font color='green'><b>1</b></font>
								</h3>
							</div>
							<div>Closed Issues</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">
						<a data-toggle="modal" data-target="#closedIssue"> More info </a></span> <span class="pull-right">
						<i class="glyphicon glyphicon-hand-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>

		<div class="col-lg-3 col-md-6">
			<div class="panel panel-info">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
								<i class="glyphicon glyphicon-thumbs-up"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">
								<h3>
									<c:set var="counter1" value="0" />
									<c:set var="abc" value="FIXED" />
									<c:forEach items="${plmDiagnose}" var="issue" varStatus="status">
									<c:if test="${abc eq issue.itemStatus}">
										<c:set var="counter1" value="${counter1 + 1}" />
									</c:if>
									</c:forEach>
										<font color='blue'><b>1</b></font>
								</h3>
							</div>
							<div>Fixed Issues</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">
						<a data-toggle="modal" data-target="#FixedIssue"> More info </a></span> <span class="pull-right">
						<i class="glyphicon glyphicon-hand-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>

		<div class="col-lg-3 col-md-6">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<div class="row">
						<div class="col-xs-3">
								<i class="glyphicon glyphicon-align-justify"></i>
						</div>
						<div class="col-xs-9 text-right">
							<div class="huge">
								<h3>
									<c:set var="counter1" value="0" />
									<c:forEach items="${plmDiagnose}" var="issue"
										varStatus="status">
										<c:set var="counter1" value="${counter1 + 1}" />
									</c:forEach>
										<font color='white'><b>10</b></font>
								</h3>
							</div>
							<div>Total Issues</div>
						</div>
					</div>
				</div>
				<a href="#">
					<div class="panel-footer">
						<span class="pull-left">
						<a data-toggle="modal" data-target="#allIssue"> More info </a></span> <span class="pull-right">
						<i class="glyphicon glyphicon-hand-right"></i></span>
						<div class="clearfix"></div>
					</div>
				</a>
			</div>
		</div>
<!-- 		For Open issue details -->
		<!-- Modal -->
		<div class="modal fade" id="openIssue" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="panel panel-info">
						<div class="panel-heading">Open Issue Details
						<button type="button" class="btn btn-info pull-right btn-sm RbtnMargin " align='right' valign='top' data-dismiss="modal">x</button>
						</div>
						<div class="panel-body">
							<table class="table table-striped table-bordered">
								<tr>
									<td><b><c:out value="ID" /></b></td>
									<td><b><c:out value="Org Code" /></b></td>
									<td><b><c:out value="ECO" /></b></td>
									<td><b><c:out value="Item NO" /></b></td>
									<td><b><c:out value="Item Status" /></b></td>
									<td><b><c:out value="Error Type" /></b></td>
									<td><b><c:out value="Last Update Date" /></b></td>
								</tr>
								<c:set var="abc" value="OPEN" />
								<c:forEach items="${plmDiagnose}" var="issue" varStatus="status">
									<c:if test="${abc eq issue.itemStatus}">
										<tr>
											<td><c:out value="${issue.id}" /></td>
											<td><c:out value="${issue.orgCode}" /></td>
											<td><c:out value="${issue.eco}" /></td>
											<td><c:out value="${issue.itemNo}" /></td>
											<td><c:out value="${issue.itemStatus}" /></td>
											<td><c:out value="${issue.errorType}" /></td>
											<td><c:out value="${issue.lastUpdateDate}" /></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
<!-- 		End here-- Open issue details -->

<!-- For Closed issue details -->
		<div class="modal fade" id="closedIssue" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="panel panel-info">
						<div class="panel-heading">Open Issue Details
						<button type="button" class="btn btn-info pull-right btn-sm RbtnMargin " align='right' valign='top' data-dismiss="modal">x</button>
						</div>
						<div class="panel-body">
							<table class="table table-striped table-bordered">
								<tr>
									<td><b><c:out value="ID" /></b></td>
									<td><b><c:out value="Org Code" /></b></td>
									<td><b><c:out value="ECO" /></b></td>
									<td><b><c:out value="Item NO" /></b></td>
									<td><b><c:out value="Item Status" /></b></td>
									<td><b><c:out value="Error Type" /></b></td>
									<td><b><c:out value="Last Update Date" /></b></td>
								</tr>
								<c:set var="abc" value="CLOSED" />
								<c:forEach items="${plmDiagnose}" var="issue" varStatus="status">
									<c:if test="${abc eq issue.itemStatus}">
										<tr>
											<td><c:out value="${issue.id}" /></td>
											<td><c:out value="${issue.orgCode}" /></td>
											<td><c:out value="${issue.eco}" /></td>
											<td><c:out value="${issue.itemNo}" /></td>
											<td><c:out value="${issue.itemStatus}" /></td>
											<td><c:out value="${issue.errorType}" /></td>
											<td><c:out value="${issue.lastUpdateDate}" /></td>
										</tr>
									</c:if>
								</c:forEach>
							</table>
						</div>
					</div>
					
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->
<!-- 		End here--Closed issue details -->
	<section class="content">
		<div class="row">
			<div class="col-xs-12">
				<div class="box">
					<datatables:table id="concurrentJob" data="${concurrentJob}"
						row="concurrentJob" theme="bootstrap3"
						cssClass="table table-striped bordered" pageable="true"
						paginationType="listBox" info="true" export="xls,pdf"
						ext="bootstrap3-responsive">
						
						<datatables:column title="Program ID" property="id"/>
						<datatables:column title="Program Name" property="programName"
							data-hide="phone,tablet" />
						<datatables:column title="Frequency" property="frequency"
							data-hide="phone,tablet" />
						<datatables:column title="SLA" property="sla" />
						<datatables:column title="Arguments" property="arguments" />
						<datatables:column title="Status" property="successRecords"/>
						<datatables:column title="Request Id" property="conRedId"/>
					</datatables:table>
				</div>
			</div>
		</div>
	</section>
	<jsp:include page="../fragments/footer.jsp" />
</aside>
</html>
