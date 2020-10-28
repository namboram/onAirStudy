<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<fmt:requestEncoding value="utf-8" />

 <section class="forms">
        <div class="container-fluid">
          <!-- Page Header-->
          <header> 
            <h1 class="h3 display">우리 스터디방                     </h1>
          </header>
          <div class="row">
            <div class="col-lg-11">
              <div class="card">
                <div class="card-header d-flex align-items-center">
                  <h4>정보수정                       </h4>
                </div>
                <div class="card-body">
                  <form class="form-horizontal">
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">스터디 방제</label>
                      <div class="col-sm-10">
                       <div class="form-group">
                          <input type="text" class="form-control form-control-lg">
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">스터디 한줄 소개</label>
                      <div class="col-sm-10">
                        <div class="form-group">
                          <input type="text" class="form-control form-control-lg">
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">우리방 목표</label>
                      <div class="col-sm-10">
                       <div class="form-group">
                          <input type="text" class="form-control form-control-lg">
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">우리방 규칙</label>
                      <div class="col-sm-10">
                        <div class="form-group">
                          <span>팀장 경고 누적   </span>
                          <input type="number" name="" id="" min="0" max="5" value="2"/>
                          <span>  회시 자동탈퇴처리  </span>  
                          <input id="inlineCheckbox1" type="checkbox" value="option1"> 
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Inline checkboxes</label>
                      <div class="col-sm-10">
                        <label class="checkbox-inline">
                          <input id="inlineCheckbox1" type="checkbox" value="option1"> 
                        </label>
                      </div>
                    </div>
                     <input class="form-control" type="number" value="42" id="example-number-input">
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Checkboxes &amp; radios <br><small class="text-primary">Custom elements</small></label>
                      <div class="col-sm-10">
                        <div class="i-checks">
                          <input id="checkboxCustom1" type="checkbox" value="" class="form-control-custom">
                          <label for="checkboxCustom1">Option one</label>
                        </div>
                        <div class="i-checks">
                          <input id="checkboxCustom2" type="checkbox" value="" checked="" class="form-control-custom">
                          <label for="checkboxCustom2">Option two checked</label>
                        </div>
                        <div class="i-checks">
                          <input id="checkboxCustom" type="checkbox" value="" disabled="" checked="" class="form-control-custom">
                          <label for="checkboxCustom">Option three checked and disabled</label>
                        </div>
                        <div class="i-checks">
                          <input id="checkboxCustom3" type="checkbox" value="" disabled="" class="form-control-custom">
                          <label for="checkboxCustom3">Option four disabled</label>
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Select</label>
                      <div class="col-sm-10 mb-3">
                        <select name="account" class="form-control">
                          <option>option 1</option>
                          <option>option 2</option>
                          <option>option 3</option>
                          <option>option 4</option>
                        </select>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row has-success">
                      <label class="col-sm-2 form-control-label">Input with success</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control is-valid">
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row has-danger">
                      <label class="col-sm-2 form-control-label">Input with error</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control is-invalid">
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>