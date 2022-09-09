var express = require('express');
var router = express.Router();

var changeCase = require('change-case');
var slug = require('slug');

function GenNavList(list, callback) {
    var result = [];
    for (var i=0; i<list.length; i++) {
        result.push({
            name: changeCase.titleCase(list[i]),
            link: slug(list[i])
        });
    }
    callback(result);
}

/* Route Press page. */
router.route('/')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/',
            title: 'Press',
            customer: req.user
        };
        res.render('press', contextDict);
    });

router.route('/careers')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/careers',
            title: 'Careers',
            customer: req.user
        };
        res.render('careers', contextDict);
    });

router.route('/partners')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/partners',
            title: 'Partners',
            customer: req.user
        };
        res.render('partners', contextDict);
    });

router.route('/about')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/about',
            title: 'About',
            customer: req.user
        };
        res.render('about', contextDict);
    });

router.route('/privacy')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/privacy',
            title: 'Privacy',
            customer: req.user
        };
        res.render('privacy', contextDict);
    });

module.exports = router;