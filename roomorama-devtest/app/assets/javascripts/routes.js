// Will be manipulated by Paloma controllers.
window.called = [];

var router = Paloma.router;

router.resource('Shortener/ShortenedUrls', {controller: 'ShortenedUrls'});
router.resource('DemosController', {controller: 'DemosController'});