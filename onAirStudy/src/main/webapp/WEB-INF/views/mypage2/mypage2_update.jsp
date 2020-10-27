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
            <h1 class="h3 display">Forms</h1>
          </header>
          <div class="row">
            <div class="col-lg-11">
              <div class="card">
                <div class="card-header d-flex align-items-center">
                  <h4>All form elements</h4>
                </div>
                <div class="card-body">
                  <form class="form-horizontal">
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Normal</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control">
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Help text</label>
                      <div class="col-sm-10">
                        <input type="text" class="form-control"><span class="text-small text-gray help-block-none">A block of help text that breaks onto a new line and may extend beyond one line.</span>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Password</label>
                      <div class="col-sm-10">
                        <input type="password" name="password" class="form-control">
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Placeholder</label>
                      <div class="col-sm-10">
                        <input type="text" placeholder="placeholder" class="form-control">
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-lg-2 form-control-label">Disabled</label>
                      <div class="col-lg-10">
                        <input type="text" disabled="" placeholder="Disabled input here..." class="form-control">
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Checkboxes and radios <br><small class="text-primary">Normal Bootstrap elements</small></label>
                      <div class="col-sm-10">
                        <div>
                          <input id="option" type="checkbox" value="">
                          <label for="option">Option one is this and that—be sure to include why it's great</label>
                        </div>
                        <div>
                          <input id="optionsRadios1" type="radio" checked="" value="option1" name="optionsRadios">
                          <label for="optionsRadios1">Option one is this and that be sure to include why it's great</label>
                        </div>
                        <div>
                          <input id="optionsRadios2" type="radio" value="option2" name="optionsRadios">
                          <label for="optionsRadios2">Option two can be something else and selecting it will deselect option one</label>
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Inline checkboxes</label>
                      <div class="col-sm-10">
                        <label class="checkbox-inline">
                          <input id="inlineCheckbox1" type="checkbox" value="option1"> a
                        </label>
                        <label class="checkbox-inline">
                          <input id="inlineCheckbox2" type="checkbox" value="option2"> b
                        </label>
                        <label class="checkbox-inline">
                          <input id="inlineCheckbox3" type="checkbox" value="option3"> c
                        </label>
                      </div>
                    </div>
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
                        <div class="i-checks">
                          <input id="radioCustom1" type="radio" value="option1" name="a" class="form-control-custom radio-custom">
                          <label for="radioCustom1">Option one</label>
                        </div>
                        <div class="i-checks">
                          <input id="radioCustom2" type="radio" checked="" value="option2" name="a" class="form-control-custom radio-custom">
                          <label for="radioCustom2">Option two checked</label>
                        </div>
                        <div class="i-checks">
                          <input id="radioCustom3" type="radio" disabled="" checked="" value="option2" class="form-control-custom radio-custom">
                          <label for="radioCustom3">Option three checked and disabled</label>
                        </div>
                        <div class="i-checks">
                          <input id="radioCustom4" type="radio" disabled="" name="a" class="form-control-custom radio-custom">
                          <label for="radioCustom4">Option four disabled</label>
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
                      <div class="col-sm-10 offset-sm-2">
                        <select multiple="" class="form-control">
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
                        <div class="invalid-feedback">Please provide your name.</div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Control sizing</label>
                      <div class="col-sm-10">
                        <div class="form-group">
                          <input type="text" placeholder=".input-lg" class="form-control form-control-lg">
                        </div>
                        <div class="form-group">
                          <input type="text" placeholder="Default input" class="form-control">
                        </div>
                        <div class="form-group">
                          <input type="text" placeholder=".input-sm" class="form-control form-control-sm">
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Column sizing</label>
                      <div class="col-sm-10">
                        <div class="row">
                          <div class="col-md-2">
                            <input type="text" placeholder=".col-md-2" class="form-control">
                          </div>
                          <div class="col-md-3">
                            <input type="text" placeholder=".col-md-3" class="form-control">
                          </div>
                          <div class="col-md-4">
                            <input type="text" placeholder=".col-md-4" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="line"> </div>
                    <div class="row">
                      <label class="col-sm-2 form-control-label">Material Inputs</label>
                      <div class="col-sm-10">
                        <div class="form-group-material">
                          <input id="register-username" type="text" name="registerUsername" required class="input-material">
                          <label for="register-username" class="label-material">Username</label>
                        </div>
                        <div class="form-group-material">
                          <input id="register-email" type="email" name="registerEmail" required class="input-material">
                          <label for="register-email" class="label-material">Email Address      </label>
                        </div>
                        <div class="form-group-material">
                          <input id="register-password" type="password" name="registerPassword" required class="input-material">
                          <label for="register-password" class="label-material">Password                                                      </label>
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Input groups</label>
                      <div class="col-sm-10">
                        <div class="form-group">
                          <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">@</span></div>
                            <input type="text" placeholder="Username" class="form-control">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="input-group">
                            <input type="text" class="form-control">
                            <div class="input-group-append"><span class="input-group-text">.00</span></div>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="input-group">
                            <div class="input-group-prepend"><span class="input-group-text">$</span></div>
                            <input type="text" class="form-control">
                            <div class="input-group-append"><span class="input-group-text">.00</span></div>
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <div class="input-group-text">
                                <input type="checkbox">
                              </div>
                            </div>
                            <input type="text" class="form-control">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <div class="input-group-text">
                                <input type="radio">
                              </div>
                            </div>
                            <input type="text" class="form-control">
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">Button addons</label>
                      <div class="col-sm-10">
                        <div class="form-group">
                          <div class="input-group">
                            <div class="input-group-prepend">
                              <button type="button" class="btn btn-primary">Go!</button>
                            </div>
                            <input type="text" class="form-control">
                          </div>
                        </div>
                        <div class="form-group">
                          <div class="input-group">
                            <input type="text" class="form-control">
                            <div class="input-group-append">
                              <button type="button" class="btn btn-primary">Go!</button>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <label class="col-sm-2 form-control-label">With dropdowns</label>
                      <div class="col-sm-10">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <button data-toggle="dropdown" type="button" class="btn btn-outline-secondary dropdown-toggle">Action <span class="caret"></span></button>
                            <div class="dropdown-menu"><a href="#" class="dropdown-item">Action</a><a href="#" class="dropdown-item">Another action</a><a href="#" class="dropdown-item">Something else here</a>
                              <div class="dropdown-divider"></div><a href="#" class="dropdown-item">Separated link</a>
                            </div>
                          </div>
                          <input type="text" class="form-control">
                        </div>
                      </div>
                    </div>
                    <div class="line"></div>
                    <div class="form-group row">
                      <div class="col-sm-4 offset-sm-2">
                        <button type="submit" class="btn btn-secondary">Cancel</button>
                        <button type="submit" class="btn btn-primary">Save changes</button>
                      </div>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>