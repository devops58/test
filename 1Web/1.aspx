<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="1.aspx.cs" Inherits="_1Web._1" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Table</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.7 -->
    <link rel="stylesheet" href="https://adminlte.io/themes/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://adminlte.io/themes/AdminLTE/bower_components/font-awesome/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://adminlte.io/themes/AdminLTE/bower_components/Ionicons/css/ionicons.min.css">
    <!-- Theme style -->
    <link rel="stylesheet" href="https://adminlte.io/themes/AdminLTE/dist/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="https://adminlte.io/themes/AdminLTE/dist/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/r/dt/dt-1.10.9/datatables.min.css" />


    <style>
        td.details-control {
            background: url('https://raw.githubusercontent.com/DataTables/DataTables/1.10.7/examples/resources/details_open.png') no-repeat center center;
            cursor: pointer;
        }

        tr.shown td.details-control {
            background: url('https://raw.githubusercontent.com/DataTables/DataTables/1.10.7/examples/resources/details_close.png') no-repeat center center;
        }
    </style>
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

    <!-- Google Font -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

        <header class="main-header">
        </header>
        <!-- Left side column. contains the logo and sidebar -->
        <aside class="main-sidebar">
        </aside>

        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper">


            <!-- Main content -->
            <section class="content">
                <div class="row">
                    <div class="col-md-6">
                        <div class="box">
                            <div class="box-header with-border">
                                <h3 class="box-title">Table</h3>
                            </div>
                            <!-- /.box-header -->
                            <div class="box-body">
                                <table id="example" class="display" cellspacing="0" width="100%">
                                    <thead>
                                        <tr>
                                            <th></th>
                                            <th>İsim - Soyisim</th>
                                            <th>TCKN</th>
                                            <th>Cep Telefonu</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    </tbody>
                                </table>
                            </div>
                            <!-- /.box-body -->

                        </div>
                        <!-- /.box -->

                        <!-- /.box -->
                    </div>

                    <!-- /.col -->
                </div>
                <!-- /.row -->

            </section>
            <!-- /.content -->
        </div>



        <!-- /.control-sidebar -->
        <!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
        <div class="control-sidebar-bg"></div>
    </div>
    <!-- ./wrapper -->

    <!-- jQuery 3 -->
    <script src="https://adminlte.io/themes/AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap 3.3.7 -->
    <script src="https://adminlte.io/themes/AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Slimscroll -->
    <script src="https://adminlte.io/themes/AdminLTE/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
    <!-- FastClick -->
    <script src="https://adminlte.io/themes/AdminLTE/bower_components/fastclick/lib/fastclick.js"></script>
    <!-- AdminLTE App -->
    <script src="https://adminlte.io/themes/AdminLTE/dist/js/adminlte.min.js"></script>
    <!-- AdminLTE for demo purposes -->
    <script src="https://adminlte.io/themes/AdminLTE/dist/js/demo.js"></script>
    <script src="https://cdn.datatables.net/r/dt/dt-1.10.9/datatables.min.js"></script>
    <script>
        function format(d) {
            var trs = '';
            $.each($(d.named), function (key, value) {
                trs += '<tr><td></td><td>' + value + '</td><td>' + d.tcknd[key] + '</td><td>' + d.phoned[key] + '</td></tr>';
            })
            return '<table class="table table-border table-hover">' +
                   '<tbody>' +

                   trs +
                '</tbody></table>';
        }

        $(document).ready(function () {
            var table = $('#example').DataTable({
                "ajax": 'http://localhost:52488/json.json',

                "columns": [
                    {
                        "class": 'details-control',
                        "orderable": false,
                        "targets": -1,
                        "data": null,
                        "defaultContent": "<button>Bilgi</button>"
                    },
                    { "data": "name" },
                    { "data": "tckn" },
                    { "data": "phone" }
                ]
            });
            $('#example tbody').on('click', 'button', function () {
                var data = table.row($(this).parents('tr')).data();
                alert("Adı - Soyadı: " + data.name + "\n T.C. No: " + data.tckn + "\n Sıra No:" + data.sıraNo + "\n Doğum Yeri: " + data.birthplace);
            });

            $('#example tbody').on('click', 'td.details-control', function () {
                var tr = $(this).closest('tr');
                var row = table.row(tr);

                if (row.child.isShown()) {
                    row.child.hide();
                    tr.removeClass('shown');
                }
                else {
                    row.child(format(row.data())).show();
                    tr.addClass('shown');
                }
            });
        });</script>
    <script>
    </script>
</body>
</html>
