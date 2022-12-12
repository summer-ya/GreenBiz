<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>User List</title>
       <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">

   
   <!-- Option 1: jQuery and Bootstrap Bundle (includes Popper) -->
   <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" ></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css">
   
     <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" /> 
     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<!--    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script> -->
   
    <script type="text/javascript">

    function getJson() {
   $.ajax({
            type:'get',
            url:'/approval/userList',
            dataType:'json',
            success: function(data) {
                var company = new Array();
                        // 데이터 받아옴
                $.each(data, function(idx, item){
                        company[idx] = {id:item.id, parent:item.parentid, text:item.name};
                });

                        // 트리 생성
                $('#tree').jstree({
                    core: {
                                    data: company    //데이터 연결
                        },
                        types: {
                               'default': {
                                    'icon': 'jstree-folder'
                                }
                        },
                        plugins: ['wholerow', 'types']
                 })
                 .bind('loaded.jstree', function(event, data){
                        //트리 로딩 롼료 이벤트
                 })
                 .bind('select_node.jstree', function(event, data){
                       //노드 선택 이벤트
                       id = data.instance.get_node(data.selected).id; //id 가져오기
                       memberList( id )
                 })
            },
            error:function (data) {
                alert("에러");
            }
       });
    }
    
    $(document).ready(function(){
       getJson();
  /*       $('#jstree').on("changed.jstree", function (e, data) {
         console.log(data.selected);
       }); */
    });
    
    function memberList( id ) {
    	var memid = null;
    	if( id != 0){
    		memid = id;
    	}
       $.ajax({
       	url: "/approval/memberList",
    	type: "post", 
        data: { memid : memid } ,   	
      }).done(function(result){
       			$("#memberList").html(result);
    		}    		
        ); 
    }

    function fn_addUser(memberno, membername, deptnum, rank) {
        
    	console.log(memberno)
    	
        var chk = document.getElementById("tr"+memberno);
        if (chk) {
        	alert("이미 선택된 사용자입니다.");
        	return;
        }
        addRow(2, memberno,  membername, rank);
    }
    
    
    function addRow(optionIndex, memberno, membername, rank) {
    	var tr = $("<tr id='tr" + memberno +"'>");
    	$("#seletedUsers > tbody").append(tr);

    	var td = $("<TD>");
    	tr.append(td);
    	
    	var typearr = ["기안", "합의", "결재"];
    	var select = $("<select class='btn btn-sm'>");
    	td.append(select);
    	for (var i=0; i<typearr.length;i++) {
    		var option = $("<option value='"+ i + "'>" + typearr[i] + "</option>");
    		select.append(option);
    		select.val(optionIndex);
    	}

    	var td = $("<TD >");
    	tr.append(td);
    	td.text(membername);
    	
    	td = $("<TD>");
    	tr.append(td);
    	td.html("<a href='javascript:UserDelete(tr"+memberno+")'><i class='bi bi-x'></i></a>");
    	
    	if (rank==="") rank = typearr[optionIndex];
    	td = $("<TD>");
    	tr.append(td);
    	td.html(rank);
    	td.css({"display": "none"});
    	
    }
   
    function UserDelete(memno) {
    	console.log(memno)
    	$(memno).remove();
    }
    
    function fn_closeUsers() {
    	var ret = "";
    	$("#seletedUsers > tbody  > tr").each(function() {
    		if (!this.id) return; 
    		var emp_no = this.id.replace("tr","");
    		var emp_name = $(this).find('td:eq(1)').text();
    		var select = $(this).find('td:eq(0) > select').val();
    		var position = $(this).find('td:eq(3)').text();
    		ret += emp_no + "," +emp_name + "," + select + "," + position + "||";
    	});
    	
    	console.log(ret)
    	fn_selectUsers(ret)
    }
    
    </script>
    <style type="text/css">
    #tree{
    width: 150px;
    }
    </style>
</head>
<body>
<div class="container" style="padding-top: 20px;">
		            <div class="row">
		            	<div class="col-lg-3" >
			            	<div class="panel panel-default" >
			            		<div class="panel-heading">
			                            <div>부서리스트</div>
			                    </div>
			                    <div class="maxHeight400">
							    	<div id="tree">
									</div>
								</div>
							</div>
		                </div> 
		            	<div class="col-lg-4" >
			            	<div class="panel panel-default" >
			            		<div class="panel-heading">
			            			<div>임직원 리스트</div>
			                    </div>
			                    <div class="panel-body maxHeight400" id="memberList">    
							    </div>    
							</div>
						</div>	
		            	<div class="col-lg-5" >
			            	<div class="panel panel-default" >
			            		<div class="panel-heading">
			            			<div>선택된사용자</div>
			                    </div>
			                    <div class="panel-body maxHeight400 text-center">
									 <table  id="seletedUsers" class="table table-sm table-striped table-bordered table-hover">
										<colgroup>
											<col width='20%' />
											<col width='40%' />
											<col width='10%' />
										</colgroup>
										<thead>
											<tr>
												<th>선택</th> 
												<th>이름</th>
												<th></th> 
												<th style="display:none"></th> 
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
							    </div>    
							</div>
						</div>	
		            </div>
            		<!-- /.row --> 
       </div>

</body>
</html>