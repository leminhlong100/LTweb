<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:setLocale value="${sessionScope.LANG}" />
<fmt:setBundle basename="app" var="lang" />
<!DOCTYPE html>
<html lang="vi">

<head>
<meta charset="UTF-8" />
<title>Đặt hàng</title>

<link rel="icon" type="image" href="../images/HaLoicon.png" />

	<jsp:include page="./link/Link.jsp"></jsp:include>

</head>

<body>
	<!-- Load page -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<div class="page">
		<jsp:include page="./header/Header.jsp"></jsp:include>

		<section id="aa-catg-head-banner">
			<div class="aa-catg-head-banner-area">
				<div class="container">
					<div class="aa-catg-head-banner-content">
						<h2>
							<fmt:message key="ORDER" bundle="${lang}"></fmt:message>
						</h2>
					</div>
				</div>
			</div>
		</section>

		<!-- Cart view section -->
		<section id="checkout">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<div class="checkout-area">
							<c:url var="addToBill" value="AddBillControl"></c:url>
							<form action="${pageContext.request.contextPath}/${addToBill}"
								method="post" accept-charset="UTF-8">
								<div class="row">
									<div class="col-md-8">
										<div class="checkout-left">
											<div class="panel-group">
												<c:if test="${sessionScope.acc == null}">
													<p>
														<fmt:message key="You.need.to.login.to.pay.Sign"
															bundle="${lang}"></fmt:message>
														<a
															href="${pageContext.request.contextPath}/client/Login.jsp"
															style="color: #754110"> <fmt:message key="in.here"
																bundle="${lang}"></fmt:message></a>
													</p>
												</c:if>
												<c:if test="${sessionScope.acc != null}">
													<!-- Shipping Address -->
													<div class="panel panel-default aa-checkout-billaddress">
														<div class="panel-heading">
															<h4 class="panel-title" style="color: #754110">
																<fmt:message key="Shipping.address" bundle="${lang}"></fmt:message>
															</h4>
														</div>
														<div id="collapseFour">
															<div class="panel-body">
																<div class="row">
																	<div class="col-md-12">
																		<div class="aa-checkout-single-bill">
																			<input style="color: black;" type="text"
																				placeholder="<fmt:message key="Full.name" bundle="${lang}"></fmt:message>*"
																				value="${sessionScope.acc.fullName }"
																				required="required" name="transaction_name">
																		</div>
																	</div>

																</div>

																<div class="row">
																	<div class="col-md-6">
																		<div class="aa-checkout-single-bill">
																			<input style="color: black;" type="email"
																				placeholder="Email*"
																				value="${sessionScope.acc.email }"
																				required="required" name="transaction_email">
																		</div>
																	</div>
																	<div class="col-md-6">
																		<div class="aa-checkout-single-bill">
																			<input style="color: black;" type="tel"
																				placeholder="<fmt:message key="Phone.number" bundle="${lang}"></fmt:message>*"
																				value="${sessionScope.acc.phone }"
																				required="required" name="transaction_phone">
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="aa-checkout-single-bill">
																			<textarea style="color: black;" cols="8" rows="3"
																				required="required"
																				placeholder="<fmt:message key="Address" bundle="${lang}"></fmt:message>*"
																				name="transaction_address">${sessionScope.acc.address }</textarea>
																		</div>
																	</div>
																</div>
																<div class="row">
																	<div class="col-md-12">
																		<div class="aa-checkout-single-bill">
																			<textarea cols="8" rows="3"
																				placeholder="<fmt:message key="Note" bundle="${lang}"></fmt:message>"
																				 name="transaction_mess"></textarea>
																		</div>
																	</div>
																</div>

																<div class="row">
																	<div class="col-md-12">
																		<div class="aa-checkout-single-bill">
																			<input type="date" placeholder="Password"
																				name="transaction_created" id="the-date"
																				style="display: none">
																		</div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</c:if>
											</div>
										</div>
									</div>
									<div class="col-md-4">
										<div class="checkout-right">
											<h4>
												<fmt:message key="Information.line" bundle="${lang}"></fmt:message>
											</h4>
											<div class="aa-order-summary-area">
												<table class="table table-responsive">
													<thead>
														<tr>
															<th><fmt:message key="product" bundle="${lang}"></fmt:message></th>
															<th><fmt:message key="Amount.of.money"
																	bundle="${lang}"></fmt:message></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach items="${sessionScope.cart}" var="o">
															<tr>
																<td>${o.value.product.nameProduct}<strong> x
																		${o.value.quantity}</strong></td>
																<td>${o.value.product.discountPrice}<fmt:message key="$"
																		bundle="${lang}"></fmt:message></td>
															</tr>
														</c:forEach>
													</tbody>
													<tfoot>
														<tr>
															<th><fmt:message key="Provisional" bundle="${lang}"></fmt:message></th>
															<td>${total}<fmt:message key="$" bundle="${lang}"></fmt:message></td>
														</tr>
														<tr>
															<th><fmt:message key="Tax" bundle="${lang}"></fmt:message></th>
															<td>0.0<fmt:message key="$" bundle="${lang}"></fmt:message></td>
														</tr>
														<tr>
															<th><fmt:message key="Total" bundle="${lang}"></fmt:message></th>
															<td><strong>${total}<fmt:message key="$"
																		bundle="${lang}"></fmt:message></strong></td>
														</tr>
													</tfoot>
												</table>
											</div>
											<h4>
												<fmt:message key="Payments" bundle="${lang}"></fmt:message>
											</h4>
											<div class="aa-payment-method">
												<label for="cashdelivery"><input type="radio"
													id="cashdelivery" name="transaction_payment" checked
													value="0"> <fmt:message
														key="Payment.on.delivery.(COD)" bundle="${lang}"></fmt:message></label>
												<label for="paypal"><input type="radio" id="paypal"
													name="transaction_payment" value="1"> <fmt:message
														key="Payment.by.Bank.(ATM)" bundle="${lang}"></fmt:message></label>
												<img
													src="${pageContext.request.contextPath}/images/paypal.jpg"
													border="0" alt="PayPal Acceptance Mark"> <input
													type="submit"
													value="<fmt:message key="ORDER" bundle="${lang}"></fmt:message>"
													class="btn-cart">
											</div>
											<c:if
												test="${sessionScope.acc != null && sessionScope.cart == null}">
												<br>
												<p style="color: red">
													<fmt:message key="Order.has.been.created.successfully"
														bundle="${lang}"></fmt:message>
												</p>
											</c:if>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- / Cart view section -->
		<!--  end content-->
		<script>
			var date = new Date();

			var day = date.getDate();
			var month = date.getMonth() + 1;
			var year = date.getFullYear();

			if (month < 10)
				month = "0" + month;
			if (day < 10)
				day = "0" + day;

			var today = year + "-" + month + "-" + day;

			document.getElementById('the-date').value = today;
		</script>
		<!-- End Main Content -->
		<jsp:include page="./footer/Footer.jsp"></jsp:include>
	</div>
</body>

</html>