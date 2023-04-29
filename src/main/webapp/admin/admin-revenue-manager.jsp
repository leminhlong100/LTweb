<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:url value="/admin/assets" var="url"/>
<fmt:setLocale value="${sessionScope.LANG}"/>
<fmt:setBundle basename="app" var="lang"/>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Danh sách nhân viên | Quản trị Admin</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="./header/link-css.jsp" flush="true"/>
</head>

<body onload="time()" class="app sidebar-mini rtl">
<!-- Navbar-->
<jsp:include page="./header/admin-left-sidebar.jsp" flush="true"/>
<main class="app-content">
  <div class="row">
    <div class="col-md-12">
      <div class="app-title">
        <ul class="app-breadcrumb breadcrumb">
          <li class="breadcrumb-item"><a href="#"><b>Báo cáo doanh thu </b></a></li>
        </ul>
        <div id="clock"></div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-lg-3">
      <div class="widget-small primary coloured-icon"><i class='icon  bx bxs-user fa-3x'></i>
        <div class="info">
          <h4>Tổng Nhân viên</h4>
          <p><b>26 nhân viên</b></p>
        </div>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="widget-small info coloured-icon"><i class='icon bx bxs-purchase-tag-alt fa-3x' ></i>
        <div class="info">
          <h4>Tổng sản phẩm</h4>
          <p><b>8580 sản phẩm</b></p>
        </div>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-shopping-bag-alt'></i>
        <div class="info">
          <h4>Tổng đơn hàng</h4>
          <p><b>457 đơn hàng</b></p>
        </div>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-info-circle' ></i>
        <div class="info">
          <h4>Bị cấm</h4>
          <p><b>4 nhân viên</b></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6 col-lg-3">
      <div class="widget-small primary coloured-icon"><i class='icon fa-3x bx bxs-chart' ></i>
        <div class="info">
          <h4>Tổng thu nhập</h4>
          <p><b>104.890.000 đ</b></p>
        </div>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="widget-small info coloured-icon"><i class='icon fa-3x bx bxs-user-badge' ></i>
        <div class="info">
          <h4>Nhân viên mới</h4>
          <p><b>3 nhân viên</b></p>
        </div>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="widget-small warning coloured-icon"><i class='icon fa-3x bx bxs-tag-x' ></i>
        <div class="info">
          <h4>Hết hàng</h4>
          <p><b>1 sản phẩm</b></p>
        </div>
      </div>
    </div>
    <div class="col-md-6 col-lg-3">
      <div class="widget-small danger coloured-icon"><i class='icon fa-3x bx bxs-receipt' ></i>
        <div class="info">
          <h4>Đơn hàng hủy</h4>
          <p><b>2 đơn hàng</b></p>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div>
          <h3 class="tile-title">SẢN PHẨM BÁN CHẠY</h3>
        </div>
        <div class="tile-body">
          <table class="table table-hover table-bordered" id="sampleTable">
            <thead>
            <tr>
              <th>Mã sản phẩm</th>
              <th>Tên sản phẩm</th>
              <th>Giá tiền</th>
              <th>Danh mục</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>71309005</td>
              <td>Bàn ăn gỗ Theresa</td>
              <td>5.600.000 đ</td>
              <td>Bàn ăn</td>
            </tr>
            <tr>
              <td>62304003</td>
              <td>Bàn ăn Vitali mặt đá</td>
              <td>33.235.000 đ</td>
              <td>Bàn ăn</td>
            </tr>
            <tr>
              <td>72109004</td>
              <td>Ghế làm việc Zuno</td>
              <td>3.800.000 đ</td>
              <td>Ghế gỗ</td>
            </tr>
            <tr>
              <td>83826226</td>
              <td>Tủ ly - tủ bát</td>
              <td>2.450.000 đ</td>
              <td>Tủ</td>
            </tr>
            <tr>
              <td>71304041</td>
              <td>Bàn ăn mở rộng Vegas</td>
              <td>21.550.000 đ</td>
              <td>Bàn thông minh</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div>
          <h3 class="tile-title">TỔNG ĐƠN HÀNG</h3>
        </div>
        <div class="tile-body">
          <table class="table table-hover table-bordered" id="sampleTable2">
            <thead>
            <tr>
              <th>ID đơn hàng</th>
              <th>Khách hàng</th>
              <th>Đơn hàng</th>
              <th>Số lượng</th>
              <th>Tổng tiền</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>MD0837</td>
              <td>Triệu Thanh Phú</td>
              <td>Ghế làm việc Zuno, Bàn ăn gỗ Theresa</td>
              <td>2 sản phẩm</td>
              <td>9.400.000 đ</td>
            </tr>
            <tr>
              <td>MĐ8265</td>
              <td>Nguyễn Thị Ngọc Cẩm</td>
              <td>Ghế ăn gỗ Lucy màu trắng</td>
              <td>1 sản phẩm</td>
              <td>3.800.000 đ</td>
            </tr>
            <tr>
              <td>MT9835</td>
              <td>Đặng Hoàng Phúc</td>
              <td>Giường ngủ Jimmy, Bàn ăn mở rộng cao cấp Dolas, Ghế làm việc Zuno</td>
              <td>3 sản phẩm</td>
              <td>40.650.000 đ</td>
            </tr>
            <tr>
              <td>ER3835</td>
              <td>Nguyễn Thị Mỹ Yến</td>
              <td>Bàn ăn mở rộng Gepa</td>
              <td>1 sản phẩm</td>
              <td>16.770.000 đ</td>
            </tr>
            <tr>
              <td>AL3947</td>
              <td>Phạm Thị Ngọc</td>
              <td>Bàn ăn Vitali mặt đá, Ghế ăn gỗ Lucy màu trắng</td>
              <td>2 sản phẩm</td>
              <td>19.770.000 đ</td>
            </tr>
            <tr>
              <td>QY8723</td>
              <td>Ngô Thái An</td>
              <td>Giường ngủ Kara 1.6x2m</td>
              <td>1 sản phẩm</td>
              <td>14.500.000 đ</td>
            </tr>
            </tbody>
            <tr>
              <th colspan="4">Tổng cộng:</th>
              <td>104.890.000 đ</td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div>
          <h3 class="tile-title">SẢN PHẨM ĐÃ HẾT</h3>
        </div>
        <div class="tile-body">
          <table class="table table-hover table-bordered" id="sampleTable3">
            <thead>
            <tr>
              <th>Mã sản phẩm</th>
              <th>Tên sản phẩm</th>
              <th>Ảnh</th>
              <th>Số lượng</th>
              <th>Tình trạng</th>
              <th>Giá tiền</th>
              <th>Danh mục</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>83826226</td>
              <td>Tủ ly - tủ bát</td>
              <td><img src="/img-sanpham/tu.jpg" alt="" width="100px;"></td>
              <td>0</td>
              <td><span class="badge bg-danger">Hết hàng</span></td>
              <td>2.450.000 đ</td>
              <td>Tủ</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-12">
      <div class="tile">
        <div>
          <h3 class="tile-title">NHÂN VIÊN MỚI</h3>
        </div>
        <div class="tile-body">
          <table class="table table-hover table-bordered" id="sampleTable4">
            <thead>
            <tr>
              <th>Họ và tên</th>
              <th>Địa chỉ</th>
              <th>Ngày sinh</th>
              <th>Giới tính</th>
              <th>SĐT</th>
              <th>Chức vụ</th>
            </tr>
            </thead>
            <tbody>
            <tr>
              <td>Hồ Thị Thanh Ngân</td>
              <td>155-157 Trần Quốc Thảo, Quận 3, Hồ Chí Minh </td>
              <td>12/02/1999</td>
              <td>Nữ</td>
              <td>0926737168</td>
              <td>Bán hàng</td>
            </tr>
            <tr>
              <td>Trần Khả Ái</td>
              <td>6 Nguyễn Lương Bằng, Tân Phú, Quận 7, Hồ Chí Minh</td>
              <td>22/12/1999</td>
              <td>Nữ</td>
              <td>0931342432</td>
              <td>Bán hàng</td>
            </tr>
            <tr>
              <td>Nguyễn Đặng Trọng Nhân</td>
              <td>59C Nguyễn Đình Chiểu, Quận 3, Hồ Chí Minh </td>
              <td>23/07/1996</td>
              <td>Nam</td>
              <td>0846881155</td>
              <td>Dịch vụ</td>
            </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-md-6">
      <div class="tile">
        <h3 class="tile-title">DỮ LIỆU HÀNG THÁNG</h3>
        <div class="embed-responsive embed-responsive-16by9">
          <canvas class="embed-responsive-item" id="lineChartDemo"></canvas>
        </div>
      </div>
    </div>
    <div class="col-md-6">
      <div class="tile">
        <h3 class="tile-title">THỐNG KÊ DOANH SỐ</h3>
        <div class="embed-responsive embed-responsive-16by9">
          <canvas class="embed-responsive-item" id="barChartDemo"></canvas>
        </div>
      </div>
    </div>
  </div>

  <div class="text-right" style="font-size: 12px">
    <p><b>Hệ thống quản lý V2.0 | Code by Trường</b></p>
  </div>
</main>
<!-- Essential javascripts for application to work-->
<jsp:include page="./header/link-js.jsp" flush="true"/>
<script type="text/javascript">$('#sampleTable').DataTable();</script>
<script type="text/javascript">$('#sampleTable2').DataTable();</script>
<script type="text/javascript">$('#sampleTable3').DataTable();</script>
<script type="text/javascript">$('#sampleTable4').DataTable();</script>

<script type="text/javascript">
  var data = {
    labels: ["Tháng 1", "Tháng 2", "Tháng 3", "Tháng 4", "Tháng 5", "Tháng 6", "Tháng 7", "Tháng 8", "Tháng 9", "Tháng 10", "Tháng 11", "Tháng 12"],
    datasets: [{
      label: "Dữ liệu đầu tiên",
      fillColor: "rgba(255, 255, 255, 0.158)",
      strokeColor: "black",
      pointColor: "rgb(220, 64, 59)",
      pointStrokeColor: "#fff",
      pointHighlightFill: "#fff",
      pointHighlightStroke: "green",
      data: [20, 59, 90, 51, 56, 100, 40, 60, 78, 53, 33, 81]
    },
      {
        label: "Dữ liệu kế tiếp",
        fillColor: "rgba(255, 255, 255, 0.158)",
        strokeColor: "rgb(220, 64, 59)",
        pointColor: "black",
        pointStrokeColor: "#fff",
        pointHighlightFill: "#fff",
        pointHighlightStroke: "green",
        data: [48, 48, 49, 39, 86, 10, 50, 70, 60, 70, 75, 90]
      }
    ]
  };


  var ctxl = $("#lineChartDemo").get(0).getContext("2d");
  var lineChart = new Chart(ctxl).Line(data);

  var ctxb = $("#barChartDemo").get(0).getContext("2d");
  var barChart = new Chart(ctxb).Bar(data);
</script>
<!-- Google analytics script-->
<script type="text/javascript">
  if (document.location.hostname == 'pratikborsadiya.in') {
    (function (i, s, o, g, r, a, m) {
      i['GoogleAnalyticsObject'] = r;
      i[r] = i[r] || function () {
        (i[r].q = i[r].q || []).push(arguments)
      }, i[r].l = 1 * new Date();
      a = s.createElement(o),
              m = s.getElementsByTagName(o)[0];
      a.async = 1;
      a.src = g;
      m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');
    ga('create', 'UA-72504830-1', 'auto');
    ga('send', 'pageview');
  }
</script>
</body>

</html>