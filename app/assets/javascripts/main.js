$(function () {
  window.vent = {
    publish: function (event, args) {
      $(window.top.document).trigger(event, args);
    },

    subscribe: function (event, delegate) {
      $(window.top.document).bind(event, delegate)
    }
  };

  if ($('#splash').length) animateLogo();

  if ($('#taste-modal').length)
    enableModal();

  if ($('#vote-results').length)
    enableVoting();

  function animateLogo() {
    setTimeout(function () {
      $('#tutti').animate({ left: '15px' }, 'slow');
      $('#frutti').animate({ left: '315px' }, 'slow', function () {
        setTimeout(function () {
          $('#dot-1').show('fast', function () {
            $('#dot-2').show('fast', function () {
              setTimeout(function () { showSlogan(null); }, 1000);
            });
          });
        }, 1000);
        $('#yoghurt').carousel();
      });
    }, 1000);

    function showSlogan(ids) {
      if (!ids) ids = ['ru', 'en'];
      $('#logo-slogan-' + ids[0]).fadeOut('slow', function () {
        $('#logo-slogan-' + ids[1]).fadeIn('slow');
        setTimeout(function () { showSlogan(ids.reverse()); }, 3000);
      });
    }
  }

  function enableModal() {
    $('#taste-modal').on('click', 'a.btn-close', function () { $('#taste-modal').modal('hide'); return false; });
    if ($('#taste-modal .modal-body').find('div').length) { $('#taste-modal').modal('show'); }
    $("body").on("hidden", ".modal", function () { $('#taste-modal .modal-body').html(''); $(this).removeData('modal'); });
  }

  function enableVoting() {
    window.vent.subscribe('VoteSuccessfull:PUT', voteSuccessfull);
    window.vent.subscribe('VoteSuccessfull:DELETE', unvoteSuccessfull);
    window.vent.subscribe('VoteStatusChanged', voteStatusChanged);

    refreshStatus();

    $('#taste-modal').on('click', 'a[data-vote="true"]', function () {
      var $a = $(this); var code = $a.data('code');
      $.ajax({
        url: $a.attr('href'),
        type: $a.data("vote-method"),
        data: { code: code },
        success: function () { window.vent.publish('VoteSuccessfull:' + $a.data("vote-method"), code); $('#taste-modal').modal('hide'); }
      });
      return false;
    });

    function refreshStatus() {
      $.getJSON("/api/vote", function (result) { window.vent.publish("VoteStatusChanged", result); });
    }

    function voteSuccessfull(event, code) {
      $('.taste-preview[data-code="' + code + '"]').addClass('voted');
      refreshStatus();
    }

    function unvoteSuccessfull(event, code) {
      $('.taste-preview[data-code="' + code + '"]').removeClass('voted');
      refreshStatus();
    }

    function voteStatusChanged(event, voteStatus) {
      var v = voteStatus.Votes.length;
      $('#vote-results span.large-number').html(v);
      $('#vote-results span#taste-ending').html(declOfNum(v, ['вкус','вкуса','вкусов']));
    }
    function declOfNum(number, titles) {
      cases = [2, 0, 1, 1, 1, 2];
      return titles[ (number%100>4 && number%100<20)? 2 : cases[(number%10<5)?number%10:5] ];
    }
  }
});
