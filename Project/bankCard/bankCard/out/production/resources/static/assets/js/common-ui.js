'use strict';

// S: Dynamic Tab + Content -- jQuery
$(function () {
	// show/hide 처리
	$(document).on('click', '[role="show"]', function (event) {
		event = event || window.event;
		event.preventDefault ? event.preventDefault() : (event.returnValue = false);

		// 선택된 탭 활성화
		$('#' + $(this).attr('aria-controls'))
			.removeAttr('hidden')
			.attr({ tabindex: '0', 'aria-hidden': 'false' })
			.addClass('is-active')
			// 기존 탭 패널 비활성화
			.siblings('.showpanel')
			.attr({ tabindex: '-1', 'aria-hidden': 'true', hidden: '' })
			.removeClass('is-active');
	});

	// let tabFocus = 0;
	$(document).on('click', '[role="tab"]', function (event) {
		event = event || window.event;
		event.preventDefault ? event.preventDefault() : (event.returnValue = false);

		// 선택된 탭 활성화
		tabActivate($(this));
		// 탭 하위에 탭이 존재하는 경우 초기화 처리
		var $thisChildren = $('#' + $(this).attr('aria-controls')).find('[role="tablist"]');
		if ($thisChildren.length) {
			tabActivate($thisChildren.children().eq(0).children('[role="tab"]'));
			$('#' + $(this).attr('aria-controls')).removeAttr('tabindex');
		}
	});

	$(document).on('keydown', '[role="tab"]', function (event) {
		event = event || window.event;
		var keycode = event.keyCode || event.which;
		var tabsLength = $(this).children('li').length;
		if (keycode === 39 || keycode === 37) {
			var firstEl = $(this).closest('[role="tablist"]').children('li').eq(0).children('[role="tab"]');
			var lastEl = $(this)
				.closest('[role="tablist"]')
				.children('li')
				.eq(tabsLength - 1)
				.children('[role="tab"]');
			$(this).parent('li').addClass('');
			if (keycode === 39) {
				$(this).parent('li').next().children('[role="tab"]').focus();
				if (!$(this).parent('li').next().length) {
					firstEl.focus();
				}
			} else if (keycode === 37) {
				$(this).parent('li').prev().children('[role="tab"]').focus();
				if (!$(this).parent('li').prev().length) {
					lastEl.focus();
				}
			}
		}
	});

	// 상품유닛용 툴팁 선언을 위한 스크립트 : 200701
	if ($('[data-toggle="tooltip"]').length > 0) {
		$('[data-toggle="tooltip"]').tooltip();
	}

	// Collapse 처리
	// 초기화
	$('.is-collapsible').each(function () {
		if ($(this).hasClass('is-active')) {
			$(this).attr({ 'aria-expanded': 'true' });
		} else {
			$(this).attr({ 'aria-expanded': 'false' }).css({ display: 'none' });
		}
	});
	$('[data-action="collapse"]').each(function () {
		if ($($(this).attr('href')).hasClass('is-active')) {
			$(this).addClass('is-active');
		} else {
			$(this).removeClass('is-active');
		}
	});
	// collapse 작동
	$(document).on('click', '[data-action="collapse"]', function (event) {
		event = event || window.event;
		event.preventDefault ? event.preventDefault() : (event.returnValue = false);
		// 스크립트 추가 : 200803
		if ($(this).hasClass('pitem-option__button') && $(this).closest('.pitem-option').length) {
			if ($(this).closest('.pitem-option').hasClass('is-active')) {
				$(this).closest('.pitem-option').removeClass('is-active');
			} else {
				$(this).closest('.pitem-option').addClass('is-active');
			}
		}
		var $target = $($(this).attr('href'));
		// 아코디언 형태인 경우
		if ($target.data('parent') !== undefined && $target.data('parent') != '') {
			var accordionParent = $target.data('parent');

			if ($(this).hasClass('is-active')) {
				$target
					.closest('#' + accordionParent)
					.find('.is-collapsible')
					.each(function () {
						if ($(this).hasClass('is-active')) {
							$(this).attr({ 'aria-expanded': 'false' }).removeClass('is-active').slideUp('fast');
						}
					});
				$(this).removeClass('is-active');
				$target.attr({ 'aria-expanded': 'false' }).removeClass('is-active').slideUp('fast');
			} else {
				$target
					.closest('#' + accordionParent)
					.find('[data-action="collapse"]')
					.removeClass('is-active');
				$target
					.closest('#' + accordionParent)
					.find('.is-collapsible')
					.removeClass('is-active')
					.delay(10)
					.slideUp('fast');
				$(this).addClass('is-active');
				$target.attr({ 'aria-expanded': 'true' }).addClass('is-active').stop().slideDown('fast');
			}
		}
		// 일반 collapse 인 경우
		else {
			if ($(this).hasClass('is-active')) {
				$(this).removeClass('is-active');
				$target.attr({ 'aria-expanded': 'false' }).removeClass('is-active').slideUp('fast');
			} else {
				$(this).addClass('is-active');
				$target.attr({ 'aria-expanded': 'true' }).addClass('is-active').stop().slideDown('fast');
			}
		}
	});


});


// 장바구니 수량 증감
$(document)
	.on('click', '.spinner-box:not(.spinner-box__not) .spinner-box__plus', function (e) {
		var countVal = parseInt($(this).closest('.spinner-box').find('input[type=number]').val());
		var toCountVal = countVal + 1;
		if (toCountVal > 99) {
			// alert('구매수량은 100개 이상이 될 수 없습니다.');
			$(this).closest('.spinner-box').find('input[type=number]').val(99);
		} else if (toCountVal <= 1) {
			// alert('구매수량은 1개 이상이어야 합니다.');
			$(this).closest('.spinner-box').find('input[type=number]').val(1);
		} else {
			$(this).closest('.spinner-box').find('input[type=number]').val(toCountVal);
		}
	})
	.on('click', '.spinner-box:not(.spinner-box__not) .spinner-box__minus', function (e) {
		var countVal = parseInt($(this).closest('.spinner-box').find('input[type=number]').val());
		var toCountVal = countVal - 1;
		if (toCountVal > 99) {
			// alert('구매수량은 100개 이상이 될 수 없습니다.');
			$(this).closest('.spinner-box').find('input[type=number]').val(99);
		} else if (toCountVal <= 1) {
			// alert('구매수량은 1개 이상이어야 합니다.');
			$(this).closest('.spinner-box').find('input[type=number]').val(1);
		} else {
			$(this).closest('.spinner-box').find('input[type=number]').val(toCountVal);
		}
	});

function tabActivate(thisEl) {
	thisEl.closest('[role="tablist"]').children().children('[aria-selected="true"]').attr({
		tabindex: '-1',
		'aria-selected': 'false',
	});
	thisEl.parent().addClass('is-active').siblings().removeClass('is-active');
	thisEl.attr({
		tabindex: '0',
		'aria-selected': 'true',
	});
	// 연관된 탭 패널 활성화
	$('#' + thisEl.attr('aria-controls'))
		.removeAttr('hidden')
		.attr('tabindex', '0')
		.addClass('is-active')
		// 기존 탭 패널 비활성화
		.siblings('.tabpanel')
		.attr({ tabindex: '-1', hidden: '' })
		.removeClass('is-active');
}
// E : Dynamic Tab + Content -- jQuery

// footer top 위치 이동 스크롤
$(document).on('click', '.button-scroll-top', function () {
	$('body, html').animate({ scrollTop: 0 });
});

// S : a 태그의 href 를 이용해 현재 페이지 스크롤 처리 : 20200615
$(document).on('click', '.tab-block-item > a[href^="#"], .box-block-item > a[href^="#"]', function (e) {
	var id = $(this).attr('href');
	var $id = $(id);
	if ($id.length === 0) {
		return;
	}
	// prevent standard hash navigation (avoid blinking in IE)
	e.preventDefault();
	// top position relative to the document
	var pos = $id.offset().top;
	// animated top scrolling
	$('body, html').animate({ scrollTop: pos });
});
// E : a 태그의 href 를 이용해 현재 페이지 스크롤 처리

// S : Dropdowns
// Functions
function getAll(selector) {
	return Array.prototype.slice.call(document.querySelectorAll(selector), 0);
}

var $dropdowns = getAll('.dropdown:not(.is-hoverable)');
$(document)
	.on('click', function (e) {
		if (!$(e.target).closest('.dropdown').length > 0) {
			$('.dropdown.is-active').removeClass('is-active');
		}
	})
	.on('mouseenter focus', '.dropdown-trigger .button', function (e) {
		$('.dropdown').removeClass('is-hover');
		$(this).closest('.dropdown').addClass('is-hover');
	})
	.on('mouseleave', '.dropdown-trigger .button', function (e) {
		$(this).closest('.dropdown').removeClass('is-hover');
	})
	.on('click', '.dropdown-trigger .button', function (e) {
		e.preventDefault();
		$('.dropdown:not(.is-hover)').removeClass('is-active');
		if ($(this).closest('.dropdown').hasClass('is-active')) {
			$(this).closest('.dropdown').removeClass('is-active');
		} else {
			$(this).closest('.dropdown').addClass('is-active');
		}
	})
	.on('click', '.dropdown-item', function (e) {
		// 드롭다운 관련 추가 : 드롭다운 dropdown 아이템 아이콘 관련 이벤트 처리
		if ($(this).hasClass('is-icon')) {
			$(this).addClass('is-active').siblings().removeClass('is-active');
			$(this).closest('.dropdown').find('[aria-controls="dropdown-menu"]').children('span').eq(0).empty().append($(this).children().clone());
			$(this).closest('.dropdown').find('[aria-controls="dropdown-menu"]').children('span').eq(0).append($(this).text());
		} else {
			$(this).addClass('is-active').siblings().removeClass('is-active');
			$(this).closest('.dropdown').find('[aria-controls="dropdown-menu"]').children('span').eq(0).text($(this).text());
		}

		var dropdownWidth = $(this).outerWidth();
		if ($('.header-search__dropdown').length > 0) {
			$(this).closest('.header-search__dropdown').css('min-width', dropdownWidth).find('.dropdown').css('width', 'auto');
		}
		$('.dropdown.is-active').removeClass('is-active');
	});

function closeDropdowns() {
	$dropdowns.forEach(function ($el) {
		$el.classList.remove('is-active');
	});
}
// E : Dropdowns
// Modals 수정 : 200722
// Modal Open
// ios 포함 스크롤 불가능하게
function mobileSrollDisable() {
	$('html').addClass('is-clipped');
	$('body').on('scroll touchmove mousewheel', function (e) {
		e.preventDefault();
	});
}
// ios 포함 스크롤 가능
function mobileSrollAble() {
	$('html').removeClass('is-clipped');
	$('body').off('scroll touchmove mousewheel');
}

$(document).on('click', '.modal-button', function (e) {
	e.preventDefault();
	if ($(this).attr('id') === 'button-footer-float') {
		console.log($(this).attr('id'))
	} else {
		footerNavbarHide();
	}
	var target = '#' + $(this).data('target');
	mobileSrollDisable();
	$(target).addClass('is-active');
});
// Modal Close
$(document).on('click', '.modal-background, .modal-close, .modal-card-head .delete, .modal .button-modal-close', function (e) {
	// closeModals();
	$(this).closest('.modal').removeClass('is-active');
	if ($('.modal.is-active').length < 1) {
		mobileSrollAble();
	}
	footerNavbarShow();
});

function closeModals() {
	mobileSrollAble();
	$(document).find('.modal').removeClass('is-active');
}
$(document).on('keydown', function (event) {
	var e = event || window.event;
	if (e.keyCode === 27) {
		closeModals();
		// closeDropdowns();
		$('.dropdown.is-active').removeClass('is-active');
	}
});
document.addEventListener('keydown', function (event) {
	var e = event || window.event;
	if (e.keyCode === 27) {
		closeModals();
		closeDropdowns();
	}
});

// 빈값 체크
var isEmpty = function (value) {
	if (value == '' || value == null || value == undefined || (value != null && typeof value == 'object' && !Object.keys(value).length)) {
		return true;
	} else {
		return false;
	}
};

// 제목 글자수 카운트 : 200908
$(document).on('keydown, blur', '[maxlength]', function () {
	var content = $(this).val();
	// var thisMaxL = Number($(this).attr('maxlength')) - 1;
	var thisMaxL = Number($(this).attr('maxlength'));

	if (content.length > thisMaxL) {
		alert('최대 ' + thisMaxL + '자까지 입력 가능합니다.');
		$(this).val(content.substring(0, thisMaxL));
		return;
	}
});


// 컨트롤 버튼 클릭 이벤트
$(document).on('click', '.button-control', function () {
	if ($(this).hasClass('is-play')) {
		$(this).removeClass('is-play');
		$(this).children('i').removeClass('ico-control-play').addClass('ico-control-pause');
		$(this).children('.sr-only').text('정지');
	} else {
		$(this).addClass('is-play');
		$(this).children('i').addClass('ico-control-play').removeClass('ico-control-pause');
		$(this).children('.sr-only').text('재생');
	}
});

// 대시보드 툴팁 왼쪽 위치 표시 
$(document).on('mouseenter', '.point-item', function () {
	var thisLeft = $(this).closest('.point-wrap').position().left;
	if (thisLeft < 230) {
		$(this).closest('.tooltip').addClass('is-pos-left');
	} else {
		$(this).closest('.tooltip').removeClass('is-pos-left');
	}
});

// 환경설정 체크박스
$(document).on('click', '.section-panel .checkbox input[type=checkbox]', function () {
	if ($(this).is(":checked")) {
		$(this).parent('.checkbox').parent('.section-panel').addClass('is-active');
	} else {
		$(this).parent('.checkbox').parent('.section-panel').removeClass('is-active');
	}
});

$(document).ready(function () {
	if ($('.section-panel').length) {
		$('.section-panel').each(function () {
			if ($(this).find('input[type=checkbox]').is(":checked")) {
				$(this).addClass('is-active');
			} else {
				$(this).removeClass('is-active');
			}
		});
	}
});
