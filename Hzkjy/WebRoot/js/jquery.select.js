var depth = 500;
var parentTopHeight = 0;
$(function() {
    $("select").each(function() {
        if ($(this).attr("keepDefaultStyle") == "true" || $(this).attr("keepDefaultStyle") == true) {} else {
            $(this).attr("trueType", "select");
            $(this).prev(".mainCon").attr("trueType", "q_select");
            $(this).selectRender()
        }
    })
}); 
(function(a) {
    a.fn.render = function() {
        if (a(this).is("select")) {
            if (a(this).attr("keepDefaultStyle") == "true" || a(this).attr("keepDefaultStyle") == true) {} else {
                a(this).attr("trueType", "select");
                a(this).prev(".mainCon").attr("trueType", "q_select");
                a(this).selectRender()
            }
        }
    };
    a.fn.setValue = function(c) {
        var b = a(this);
        if (b.attr("trueType") == "select") {
            b.attr("selectedValue", c);
            b.render()
        }
    };
    a.fn.resetValue = function() {
        var b = a(this);
        if (b.attr("trueType") == "select") {
            b.render()
        }
    };
    a.fn.addItem = function(c) {
        var b = a(this);
        if (b.attr("trueType") == "select") {
            b.selectAddItem(c)
        }
    };
    a.fn.removeItem = function(c) {
        var b = a(this);
        if (b.attr("trueType") == "select") {
            b.selectRemoveItem(c)
        }
    };
    //add  swq 2014-03-13 
    a.fn.laodselect = function(url){
    	var b = a(this);
		$.ajax({
			url: url,
			async: false,
			encoding: 'UTF-8',
			dataType: "json",
			success: function(data) {
				b.data("data", data);
				b.render();
			}
		});
	}
})(jQuery);
function getPosition(c, d) {
    var a = -1;
    for (var b = 0; b < d.length; b++) {
        if (c == d[b]) {
            a = b;
            break
        }
    }
    return a
}
jQuery.fn.extend({
    selectRender: function() {
        return this.each(function() {
            if ($(this).prev("div").hasClass("mainCon")) {
                $(this).prev("div").remove()
            }
            new jQuery.SelectBox(this)
        })
    },
    selectAddItem: function(a) {
        this.each(function() {
            var b = $(this).data("data");
            var c = "list";
            if ($(this).attr("dataRoot")) {
                c = $(this).attr("dataRoot")
            }
            b[c].push(a);
            $(this).data("data", b);
            $(this).prev(".mainCon").remove();
            new jQuery.SelectBox(this)
        })
    },
    selectRemoveItem: function(a) {
        this.each(function() {
            var b = $(this).data("data");
            var c = -1;
            var d = "list";
            if ($(this).attr("dataRoot")) {
                d = $(this).attr("dataRoot")
            }
            $.each(b[d], 
            function(e, f) {
                if (f.value.toString() == a) {
                    c = e
                }
            });
            if (c != -1) {
                b[d].splice(c, 1)
            }
            $(this).data("data", b);
            $(this).prev(".mainCon").remove();
            new jQuery.SelectBox(this)
        })
    }
});
if (!window.console) {
    var console = {
        log: function(a) {}
    }
}
var elm_id = 1;
jQuery.SelectBox = function(selectobj) {
    var opt = {};
    opt.inputClass = opt.inputClass || "selectbox";
    opt.containerClass = opt.containerClass || "selectbox-wrapper";
    opt.hoverClass = opt.hoverClass || "current";
    opt.currentClass = opt.selectedClass || "selected";
    opt.debug = opt.debug || false;
    elm_id++;
    var curInputId = "0_input";
    var curButtonId = "0_button";
    var active = 0;
    var inFocus = false;
    var hasfocus = 0;
    var $select = $(selectobj);
    var $container = setupContainer(opt);
    var $mainCon = setupMainCon();
    var $input = setupInput(opt);
    var autoWidth = false;
    var edit = false;
    var colNum = 1;
    var colWidth;
    var selTrueWidth;
    var windowsFlag = 0;
    var containerClick = 0;
    if (window.navigator.userAgent.indexOf("Windows") > -1) {
        windowsFlag = 1
    }
    selTrueWidth = $select.width();
    if (selTrueWidth == "0") {
        selTrueWidth = 116
    }
    var $selBtn;
    $selBtn = $("<input type='button' value=' ' class='selBtn'/>");
    $selBtn.attr("id", elm_id + "_button");
    var $loader = $("<div class='loader'>数据加载中...</div>");
    if ($select.attr("colNum") != null) {
        colNum = parseInt($select.attr("colNum"))
    }
    if ($select.attr("colWidth") != null) {
        colWidth = Number($select.attr("colWidth"))
    } else {
        colWidth = 100
    }
    var inputWidth = 99;
    if ($select.attr("selWidth") != null) {
        inputWidth = Number($select.attr("selWidth")) - 22
    }
    $input.width(inputWidth);
    $select.hide().before($mainCon);
    var $table = $('<table cellspacing="0" cellpadding="0" style="border-style:none;"><tr><td class="ali01" style="border-style:none;padding:0;margin:0;"></td><td class="ali01" style="border-style:none;;padding:0;margin:0;"></td></tr></table>');
    $table.find("td").eq(0).append($input);
    $table.find("td").eq(1).append($selBtn);
    $mainCon.append($table);
    $mainCon.append($container);
    $mainCon.append($loader);
    $loader.hide();
    if ($select.attr("disabled") == "disabled" || $select.attr("disabled") == "true" || $select.attr("disabled") == true) {
        $selBtn.attr("disabled", true);
        $selBtn.addClass("selBtn_disabled");
        $input.addClass("selectbox_disabled")
    }
    init();
    if ($select.attr("editable") != null) {
        if ($select.attr("editable") == "true") {
            edit = true
        } else {
            edit = false
        }
    }
    if (!edit) {
        $input.css({
            cursor: "pointer"
        });
        $input.click(function(event) {
            curInputId = $(event.target).attr("id");
            setHeight();
            if ($container.attr("hasfocus") == 0) {
                showMe()
            } else {
                hideMe()
            }
        }).keydown(function(event) {
            switch (event.keyCode) {
            case 38:
                event.preventDefault();
                moveSelect( - 1);
                break;
            case 40:
                event.preventDefault();
                moveSelect(1);
                break;
            case 13:
                event.preventDefault();
                $("li." + opt.hoverClass).trigger("click");
                break;
            case 27:
                hideMe();
                break
            }
        })
    } else {
        $input.css({
            cursor:
            "text"
        });
        $input.change(function() {
            $select.attr("editValue", $(this).val())
        })
    }
    $selBtn.click(function(event) {
        curButtonId = $(event.target).attr("id");
        setHeight();
        if ($container.attr("hasfocus") == 0) {
            showMe()
        } else {
            hideMe()
        }
    }).keydown(function(event) {
        switch (event.keyCode) {
        case 38:
            event.preventDefault();
            moveSelect( - 1);
            break;
        case 40:
            event.preventDefault();
            moveSelect(1);
            break;
        case 13:
            event.preventDefault();
            $("li." + opt.hoverClass).trigger("click");
            break;
        case 27:
            hideMe();
            break
        }
    });
    function setHeight() {
        var oldHeight;
        var $lis = $container.find("li").length;
        if (colNum == 1) {
            oldHeight = $lis * 26
        } else {
            if ($lis % colNum == 0) {
                oldHeight = $lis * 26 / colNum
            } else {
                oldHeight = ($lis - $lis % colNum) * 26 / colNum + 26
            }
        }
        $container.height(oldHeight);
        var usefulHeight = 200;
        if (parentTopHeight > 0) {
            var parentMainHeight = window.top.document.documentElement.clientHeight;
            usefulHeight = parentMainHeight - parentTopHeight - parentBottomHeight - $mainCon.offset().top - 30
        } else {
            usefulHeight = window.document.documentElement.clientHeight - ($mainCon.offset().top - $(window).scrollTop()) - 30
        }
        var trueWidth;
        if (!$select.attr("boxWidth")) {
            trueWidth = $container.width()
        }
        $container.css({
            overflowY: "auto",
            overflowX: "hidden"
        });
        if (colNum != 1) {
            $container.width((colWidth + 6) * colNum)
        } else {
            if (!$select.attr("boxWidth")) {
                $container.width(trueWidth)
            } else {
                $container.width(Number($select.attr("boxWidth")) + 1)
            }
        }
        var boxHeight = 0;
        if ($select.attr("boxHeight")) {
            boxHeight = Number($select.attr("boxHeight"))
        }
        if (boxHeight != 0) {
            $container.height(boxHeight);
            if ($select.attr("openDirection") == "top") {
                $container.css({
                    top: -boxHeight
                })
            } else {
                if ($select.attr("openDirection") == "bottom") {
                    $container.css({
                        top: 24
                    })
                } else {
                    if (usefulHeight < boxHeight) {
                        if ($mainCon.offset().top > boxHeight) {
                            $container.css({
                                top: -boxHeight
                            })
                        } else {
                            if (usefulHeight < 100 && $mainCon.offset().top > usefulHeight && $mainCon.offset().top > 100) {
                                $container.css({
                                    top: -boxHeight
                                })
                            } else {
                                $container.css({
                                    top: 24
                                })
                            }
                        }
                    } else {
                        $container.css({
                            top: 24
                        })
                    }
                }
            }
        } else {
            if ($select.attr("openDirection") == "top") {
                if ($mainCon.offset().top > oldHeight) {
                    $container.css({
                        top: -oldHeight
                    })
                } else {
                    $container.height($mainCon.offset().top);
                    $container.css({
                        top: -oldHeight
                    })
                }
            } else {
                if ($select.attr("openDirection") == "bottom") {
                    if (usefulHeight < oldHeight) {
                        $container.css({
                            top: 24
                        });
                        $container.height(usefulHeight)
                    } else {
                        $container.css({
                            top: 24
                        })
                    }
                } else {
                    if (usefulHeight < oldHeight) {
                        if ($mainCon.offset().top > oldHeight) {
                            $container.css({
                                top: -oldHeight
                            })
                        } else {
                            if (usefulHeight < 100 && $mainCon.offset().top > usefulHeight && $mainCon.offset().top > 100) {
                                $container.height($mainCon.offset().top);
                                $container.css({
                                    top: -oldHeight
                                })
                            } else {
                                $container.css({
                                    top: 24
                                });
                                $container.height(usefulHeight)
                            }
                        }
                    } else {
                        $container.css({
                            top: 24
                        })
                    }
                }
            }
        }
        if (!$select.attr("boxWidth")) {
            if ($container.width() < inputWidth + 24) {
                $container.width(inputWidth + 24)
            }
        }
    }
    function hideMe() {
        $container.attr("hasfocus", 0);
        $container.hide();
        $("body").unbind("mousedown", onBodyDown)
    }
    function showMe() {
        $container.attr("hasfocus", 1);
        depth++;
        $mainCon.css({
            zIndex: depth
        });
        $container.show();
        $("body").bind("mousedown", onBodyDown)
    }
    function onBodyDown(event) {
        if ($(event.target).attr("id") == curInputId || $(event.target).attr("id") == curButtonId || $(event.target).parent().attr("class") == "selectbox-wrapper" || $(event.target).attr("class") == "selectbox-wrapper" || $(event.target).parents(".selectbox-wrapper").length > 0) {} else {
            hideMe()
        }
    }
    function init() {
        $container.append(getSelectOptions($input.attr("id"))).hide();
        var width = $input.css("width")
    }
    function setupMainCon() {
        var $con = $("<div></div>");
        $con.addClass("mainCon");
        return $con
    }
    function setupContainer(options) {
        var $container = $("<div></div>");
        $container.attr("id", elm_id + "_container");
        $container.addClass(options.containerClass);
        $container.css({});
        $container.attr("hasfocus", 0);
        return $container
    }
    function setupInput(options) {
        var input = document.createElement("input");
        var $input = $(input);
        $input.attr("id", elm_id + "_input");
        $input.attr("type", "text");
        $input.addClass(options.inputClass);
        $input.attr("autocomplete", "off");
        var seledit = false;
        if ($select.attr("editable") != null) {
            if ($select.attr("editable") == "true") {
                seledit = true
            } else {
                seledit = false
            }
        }
        if (!seledit) {
            $input.attr("readonly", "readonly")
        } else {
            $input.attr("readonly", false)
        }
        $input.attr("tabIndex", $select.attr("tabindex"));
        if ($select.attr("disabled") == "disabled" || $select.attr("disabled") == "true" || $select.attr("disabled") == true) {
            $input.attr("disabled", true);
            $input.addClass("inputDisabled")
        }
        return $input
    }
    function moveSelect(step) {
        var lis = $("li", $container);
        if (!lis || lis.length == 0) {
            return false
        }
        active += step;
        if (active < 0) {
            active = lis.size()
        } else {
            if (active > lis.size()) {
                active = 0
            }
        }
        scroll(lis, active);
        lis.removeClass(opt.hoverClass);
        $(lis[active]).addClass(opt.hoverClass)
    }
    function scroll(list, active) {
        var el = $(list[active]).get(0);
        var list = $container.get(0);
        if (el.offsetTop + el.offsetHeight > list.scrollTop + list.clientHeight) {
            list.scrollTop = el.offsetTop + el.offsetHeight - list.clientHeight
        } else {
            if (el.offsetTop < list.scrollTop) {
                list.scrollTop = el.offsetTop
            }
        }
    }
    function setCurrent() {
        var li = $("li." + opt.currentClass, $container).get(0);
        var ar = (li.id).split("_");
        var idLength = ar[0].length + ar[1].length + 2;
        var str = li.id;
        var el = str.substr(idLength, str.length);
        $select.val(el);
        $select.attr("relText", $(li).text());
        $select.attr("relValue", el);
        var str = $(li).html().trim();
        $input.val(str);
        if (edit == true) {
            $select.attr("editValue", $input.val())
        }
        $select.focus();
        return true
    }
    function getCurrentSelected() {
        return $select.val()
    }
    function getCurrentValue() {
        return $input.val()
    }
    function getSelectOptions(parentid) {
        var select_options = new Array();
        var ul = document.createElement("ul");
        var otpArr = [];
        var idxFix = 0;
        var rel;
        if ($select.attr("childId") != null) {
            rel = true
        }
        var isEditable;
        if ($select.attr("editable") != null) {
            if ($select.attr("editable") == "true") {
                isEditable = true
            } else {
                isEditable = false
            }
        }
        var ajaxMode = false;
        var urlStr = $select.attr("url");
        var dataStr = $select.attr("data");
        var dataObj3 = $select.data("data");
        if (urlStr != null || dataStr != null || dataObj3 != null) {
            ajaxMode = true
        }
        if (ajaxMode == true) {
            var dataRoot = "list";
            if ($select.attr("dataRoot")) {
                dataRoot = $select.attr("dataRoot")
            }
            var paramsStr = $select.attr("params");
            var paramsObj;
            if (paramsStr) {
                try {
                    paramsObj = eval("(" + paramsStr + ")")
                } catch(e) {
                    paramsObj = "";
                    alert("参数格式有误！（提示：放在标签中的json数据的属性和名称必须以双引号包围）")
                }
            } else {
                paramsObj = ""
            }
            if (dataObj3) {
                createOptions(dataObj3, parentid, colNum, colWidth, isEditable, rel, ul, dataRoot)
            } else {
                if (dataStr) {
                    var dataObj2;
                    try {
                        dataObj2 = eval("(" + dataStr + ")")
                    } catch(e) {
                        dataObj2 = "";
                        alert("参数格式有误！（提示：json数据key与value必须以双引号包围）")
                    }
                    $select.data("data", dataObj2);
                    createOptions(dataObj2, parentid, colNum, colWidth, isEditable, rel, ul, dataRoot)
                } else {
                    if (urlStr) {
                        $.ajax({
                            url: $select.attr("url"),
                            dataType: "json",
                            data: paramsObj,
                            error: function() {
                                alert("单选下拉框数据源出错，请检查url路径")
                            },
                            success: function(data) {
                                $select.data("data", data);
                                createOptions(data, parentid, colNum, colWidth, isEditable, rel, ul, dataRoot)
                            }
                        })
                    }
                }
            }
        } else {
            $select.find("option").each(function() {
                otpArr.push($(this)[0]);
                var li = document.createElement("li");
                li.setAttribute("id", parentid + "_" + $(this).val());
                li.innerHTML = $(this).html();
                if ($(this).is(":selected")) {
                    if (isEditable == true) {
                        $input.val($(this).html());
                        $(li).addClass(opt.currentClass)
                    } else {
                        var str = $(this).html().trim();
                        $input.val(str);
                        $(li).addClass(opt.currentClass)
                    }
                }
                if (colNum != 1) {
                    $(li).addClass("li_left");
                    if (colWidth != null) {
                        $(li).width(colWidth)
                    } else {
                        var selWidth = Number(selTrueWidth);
                        $(li).width(selWidth)
                    }
                }
                ul.appendChild(li);
                $(li).mouseover(function(event) {
                    hasfocus = 1;
                    if (opt.debug) {
                        console.log("over on : " + this.id)
                    }
                    jQuery(event.target, $container).addClass(opt.hoverClass)
                }).mouseout(function(event) {
                    hasfocus = -1;
                    if (opt.debug) {
                        console.log("out on : " + this.id)
                    }
                    jQuery(event.target, $container).removeClass(opt.hoverClass)
                }).click(function(event) {
                    var fl = $("li." + opt.hoverClass, $container).get(0);
                    if (opt.debug) {
                        console.log("click on :" + this.id)
                    }
                    var myId = $(this).attr("id").split("_");
                    $("#" + myId[0] + "_container li." + opt.currentClass).removeClass(opt.currentClass);
                    $(this).addClass(opt.currentClass);
                    setCurrent();
                    $select.get(0).blur();
                    hideMe();
                    try {
                        $select.trigger("change")
                    } catch(e) {}
                    $input.removeClass("tipColor");
                    if (rel) {
                        ajaxLoad($select, $select.val())
                    }
                });
                if ($select.attr("editValue") != null) {
                    $input.val($select.attr("editValue"))
                }
            })
        }
        $select.find("optgroup").each(function() {
            var idx = getPosition($(this).children("option").eq(0)[0], otpArr);
            var groupValue = $(this).attr("label");
            $(ul).find("li").eq(idx + idxFix).before("<li class='group'>" + groupValue + "</li>");
            idxFix++
        });
        return ul
    }
    function createOptions(data, parentid, colNum, colWidth, isEditable, rel, ul, dataRoot, paramsObj) {
        if (!data) {
            return
        }
        var promptText = "请选择";
        if ($select.attr("prompt") != null) {
            if ($select.attr("prompt") == "") {
                promptText = "请选择"
            } else {
                promptText = $select.attr("prompt")
            }
        }
        var selectedIdx = -1;
        var selectedValue = "";
        if ($select.attr("selectedIdx")) {
            selectedIdx = Number($select.attr("selectedIdx"))
        }
        if ($select.attr("selectedValue")) {
            selectedValue = $select.attr("selectedValue")
        }
        $select.attr("length", 10);
        if ($select.attr("prompt") != null) {
            var li0 = document.createElement("li");
            li0.setAttribute("id", parentid + "_");
            li0.innerHTML = promptText;
            if (selectedIdx == -1 && selectedValue == "") {
                $(li0).addClass(opt.currentClass);
                $input.val(li0.innerHTML)
            }
            ul.appendChild(li0);
            $select[0].options.length = 0;
            $select[0].options[$select[0].options.length] = new Option(promptText, "");
            if (colNum != 1) {
                $(li0).addClass("li_left");
                if (colWidth != null) {
                    $(li0).width(colWidth)
                } else {
                    var selWidth = Number(selTrueWidth);
                    $(li0).width(selWidth)
                }
            }
            $(li0).mouseover(function(event) {
                hasfocus = 1;
                if (opt.debug) {
                    console.log("over on : " + this.id)
                }
                jQuery(event.target, $container).addClass(opt.hoverClass)
            }).mouseout(function(event) {
                hasfocus = -1;
                if (opt.debug) {
                    console.log("out on : " + this.id)
                }
                jQuery(event.target, $container).removeClass(opt.hoverClass)
            }).click(function(event) {
                var fl = $("li." + opt.hoverClass, $container).get(0);
                if (opt.debug) {
                    console.log("click on :" + this.id)
                }
                var myId = $(this).attr("id").split("_");
                $("#" + myId[0] + "_container li." + opt.currentClass).removeClass(opt.currentClass);
                $(this).addClass(opt.currentClass);
                setCurrent();
                $select.get(0).blur();
                hideMe();
                $select.trigger("change");
                $input.removeClass("tipColor")
            })
        }
        if ($select.attr("prompt") == null) {
            if (selectedIdx == -1 && selectedValue == "") {
                selectedIdx = 0
            }
        }
        $.each(data[dataRoot], 
        function(idx, item) {
            var li = document.createElement("li");
            li.setAttribute("id", parentid + "_" + item.value);
            li.innerHTML = item.key;
            $select[0].options[$select[0].options.length] = new Option(item.key, item.value);
            if (selectedIdx == idx) {
                if (isEditable == true) {
                    $(li).addClass(opt.currentClass);
                    $input.val(li.innerHTML);
                    $select.val(item.value);
                    $select.attr("relText", item.key);
                    $select.attr("editValue", item.key)
                } else {
                    $(li).addClass(opt.currentClass);
                    $input.val(li.innerHTML.trim());
                    $select.val(item.value);
                    $select.attr("relText", item.key);
                    $select.attr("relValue", item.value)
                }
            } else {
                if (selectedValue != "") {
                    if (selectedValue == item.value.toString()) {
                        if (isEditable == true) {
                            $(li).addClass(opt.currentClass);
                            $input.val(li.innerHTML);
                            $select.val(item.value);
                            $select.attr("relText", item.key);
                            $select.attr("editValue", item.key)
                        } else {
                            $(li).addClass(opt.currentClass);
                            $input.val(li.innerHTML.trim());
                            $select.val(item.value);
                            $select.attr("relText", item.key);
                            $select.attr("relValue", item.value)
                        }
                    }
                }
            }
            if (colNum != 1) {
                $(li).addClass("li_left");
                if (colWidth != null) {
                    $(li).width(colWidth)
                } else {
                    var selWidth = Number(selTrueWidth);
                    $(li).width(selWidth)
                }
            }
            $(li).mouseover(function(event) {
                hasfocus = 1;
                if (opt.debug) {
                    console.log("over on : " + this.id)
                }
                jQuery(event.target, $container).addClass(opt.hoverClass)
            }).mouseout(function(event) {
                hasfocus = -1;
                if (opt.debug) {
                    console.log("out on : " + this.id)
                }
                jQuery(event.target, $container).removeClass(opt.hoverClass)
            }).click(function(event) {
                var fl = $("li." + opt.hoverClass, $container).get(0);
                if (opt.debug) {
                    console.log("click on :" + this.id)
                }
                var myId = $(this).attr("id").split("_");
                $("#" + myId[0] + "_container li." + opt.currentClass).removeClass(opt.currentClass);
                $(this).addClass(opt.currentClass);
                setCurrent();
                $select.get(0).blur();
                hideMe();
                try {
                    $select.trigger("change")
                } catch(e) {}
                $input.removeClass("tipColor");
                if (rel) {
                    ajaxLoad($select, $select.val())
                }
            });
            ul.appendChild(li);
            if ($select.attr("editValue") != null) {
                $input.val($select.attr("editValue"))
            }
        });
        $select.attr("finished", "true")
    }
    function ajaxLoad(obj, value) {
        if (value != "") {
            var child = obj.attr("childId");
            var $childLoader = $("#" + child).prev().find("div[class=loader]");
            $childLoader.show();
            window.setTimeout(function() {
                loadLater(obj, value)
            },
            200)
        }
    }
    function loadLater(obj, value) {
        var dataPath;
        if (obj.attr("childDataType") == null) {
            dataPath = obj.attr("childDataPath") + value
        } else {
            if (obj.attr("childActionType") == "local") {
                dataPath = obj.attr("childDataPath") + value + "." + obj.attr("childDataType")
            } else {
                dataPath = obj.attr("childDataPath") + value
            }
        }
        if (obj.attr("childDataType") == "xml") {
            $.ajax({
                url: dataPath,
                error: function() {
                    try {
                        top.Dialog.alert("数据加载失败，请检查childDataPath是否正确")
                    } catch(e) {
                        alert("数据加载失败，请检查childDataPath是否正确")
                    }
                },
                success: function(xml) {
                    var child = obj.attr("childId");
                    var $childLoader = $("#" + child).prev().find("div[class=loader]");
                    $childLoader.hide();
                    var $childUL = $("#" + child).prev().find("ul");
                    var childOptId = $("#" + child).prev().find(">div").attr("id").split("_")[0];
                    var $childInput = $("#" + child).prev().find("input:text");
                    var childSel = $("#" + child)[0];
                    $childUL.html("");
                    childSel.options.length = 0;
                    $(xml).find("node").each(function() {
                        var text = $(this).attr("text");
                        var value = $(this).attr("value");
                        var li = document.createElement("li");
                        $(li).text(text);
                        $(li).attr("relValue", value);
                        $childUL.append($(li));
                        childSel.options[childSel.options.length] = new Option(text, value);
                        $(li).mouseover(function(event) {
                            jQuery(event.target).addClass(opt.hoverClass)
                        });
                        $(li).mouseout(function(event) {
                            jQuery(event.target).removeClass(opt.hoverClass)
                        });
                        $(li).mousedown(function(event) {
                            $("#" + childOptId + "_container li." + opt.currentClass).removeClass(opt.currentClass);
                            $(this).addClass(opt.currentClass);
                            $("#" + child).attr("relText", $(this).text());
                            $("#" + child).attr("relValue", $(this).attr("relValue"));
                            $("#" + child).val($(this).attr("relValue"));
                            $childInput.val($(this).html());
                            $("#" + child).prev().find(">div").hide();
                            $("#" + child).focus();
                            if ($("#" + child).attr("onchange") != null) {}
                            try {
                                $("#" + child).trigger("change")
                            } catch(e) {}
                            var rel;
                            if ($("#" + child).attr("childId") != null) {
                                rel = true
                            }
                            if (rel) {
                                ajaxLoad($("#" + child), $("#" + child).val())
                            }
                        })
                    });
                    if ($(xml).find("node").length == 0) {
                        var li = document.createElement("li");
                        $(li).text("无内容");
                        $childUL.append($(li))
                    }
                    var $firstLI = $childUL.find("li").eq(0);
                    $childInput.val($firstLI.text());
                    $firstLI.addClass(opt.currentClass);
                    $("#" + child).val($firstLI.attr("relValue"));
                    $("#" + child).attr("relValue", $firstLI.attr("relValue"));
                    $("#" + child).attr("relText", $firstLI.text());
                    $("#" + child).trigger("ajaxInit")
                }
            })
        } else {
            $.getJSON(dataPath, 
            function(data) {
                var child_j = obj.attr("childId");
                var $childLoader_j = $("#" + child_j).prev().find("div[class=loader]");
                $childLoader_j.hide();
                var $childUL_j = $("#" + child_j).prev().find("ul");
                var childOptId_j = $("#" + child_j).prev().find(">div").attr("id").split("_")[0];
                var $childInput_j = $("#" + child_j).prev().find("input:text");
                var childSel_j = $("#" + child_j)[0];
                $childUL_j.html("");
                childSel_j.options.length = 0;
                var dataRoot = "list";
                if ($("#" + child_j).attr("dataRoot")) {
                    dataRoot = $("#" + child_j).attr("dataRoot")
                }
                if ($("#" + child_j).attr("prompt")) {
                    var li_j0 = document.createElement("li");
                    var text_j0 = $("#" + child_j).attr("prompt");
                    $(li_j0).text(text_j0);
                    $(li_j0).attr("relValue", "");
                    $childUL_j.append($(li_j0));
                    childSel_j.options[childSel_j.options.length] = new Option(text_j0, "");
                    $(li_j0).mouseover(function(event) {
                        jQuery(event.target).addClass(opt.hoverClass)
                    });
                    $(li_j0).mouseout(function(event) {
                        jQuery(event.target).removeClass(opt.hoverClass)
                    });
                    $(li_j0).mousedown(function(event) {
                        $("#" + childOptId_j + "_container li." + opt.currentClass).removeClass(opt.currentClass);
                        $(this).addClass(opt.currentClass);
                        $("#" + child_j).attr("relText", $(this).text());
                        $("#" + child_j).attr("relValue", $(this).attr("relValue"));
                        $("#" + child_j).val($(this).attr("relValue"));
                        $childInput_j.val($(this).html());
                        $("#" + child_j).prev().find(">div").hide();
                        $("#" + child_j).focus();
                        if ($("#" + child_j).attr("onchange") != null) {}
                        try {
                            $("#" + child_j).trigger("change")
                        } catch(e) {}
                    })
                }
                $.each(data[dataRoot], 
                function(idx, item) {
                    var text_j = item.key;
                    var value_j = item.value;
                    var li_j = document.createElement("li");
                    $(li_j).text(text_j);
                    $(li_j).attr("relValue", value_j);
                    $childUL_j.append($(li_j));
                    childSel_j.options[childSel_j.options.length] = new Option(text_j, value_j);
                    $(li_j).mouseover(function(event) {
                        jQuery(event.target).addClass(opt.hoverClass)
                    });
                    $(li_j).mouseout(function(event) {
                        jQuery(event.target).removeClass(opt.hoverClass)
                    });
                    $(li_j).mousedown(function(event) {
                        $("#" + childOptId_j + "_container li." + opt.currentClass).removeClass(opt.currentClass);
                        $(this).addClass(opt.currentClass);
                        $("#" + child_j).attr("relText", $(this).text());
                        $("#" + child_j).attr("relValue", $(this).attr("relValue"));
                        $("#" + child_j).val($(this).attr("relValue"));
                        $childInput_j.val($(this).html());
                        $("#" + child_j).prev().find(">div").hide();
                        $("#" + child_j).focus();
                        if ($("#" + child_j).attr("onchange") != null) {}
                        try {
                            $("#" + child_j).trigger("change")
                        } catch(e) {}
                        var rel_j;
                        if ($("#" + child_j).attr("childId") != null) {
                            rel_j = true
                        }
                        if (rel_j) {
                            ajaxLoad($("#" + child_j), $("#" + child_j).val())
                        }
                    })
                });
                if (data.length == 0) {
                    var li_j = document.createElement("li");
                    $(li_j).text("无内容");
                    $childUL_j.append($(li_j))
                }
                var $firstLI_j = $childUL_j.find("li").eq(0);
                $childInput_j.val($firstLI_j.text());
                $firstLI_j.addClass(opt.currentClass);
                $("#" + child_j).val($firstLI_j.attr("relValue"));
                $("#" + child_j).attr("relValue", $firstLI_j.attr("relValue"));
                $("#" + child_j).attr("relText", $firstLI_j.text());
                $("#" + child_j).trigger("ajaxInit")
            })
        }
    }
};
String.prototype.trim = function() {
    return this.replace(/(^\s*)|(\s*$)/g, "")
};