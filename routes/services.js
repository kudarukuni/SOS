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

/* Route Services page. */
router.route('/')
    .all(function (req, res, next) {
        var list = ['shipment', 'return policy', 'payment', 'voucher'];
        GenNavList(list, function(navList){
            var contextDict = {
                currentUrl: '/services',
                navList: navList,
                title: 'Services',
                customer: req.user
            };
            res.render('services', contextDict);
        });
    });

router.route('/')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/',
            title: 'Services',
            customer: req.user
        };
        res.render('services', contextDict);
    });

router.route('/shipment')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/shipment',
            title: 'Shipment',
            customer: req.user
        };
        res.render('shipment', contextDict);
    });

router.route('/returns')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/returns',
            title: 'Return Policy',
            customer: req.user
        };
        res.render('returns', contextDict);
    });

router.route('/payment')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/payment',
            title: 'Payment',
            customer: req.user
        };
        res.render('payment', contextDict);
    });

router.route('/voucher')
    .get(function (req, res, next) {
        var contextDict = {
            currentUrl: '/voucher',
            title: 'Voucher',
            customer: req.user
        };
        res.render('voucher', contextDict);
    });

module.exports = router;