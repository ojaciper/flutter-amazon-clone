const express = require('express');
const adminRouter = express.Router();
const admin = require('../middlewares/admin');
const {Product} = require('../models/product');

// adding product start here
adminRouter.post('/admin/add-product', admin, async (req, res) => {
    try {
        const { name, description, images, quantity, price, category } = req.body;

        let product = new Product({
            name:name,
            description:description,
            images:images,
            quantity:quantity,
            price:price,
            category:category,
        });
        product = await product.save();
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});
// end here

// geting all the product start here
adminRouter.get('/admin/get-product', admin, async (req, res) => {
    try {
        const product = await Product.find({});
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }
});
// end here

// deleting the product start here
adminRouter.post('/admin/delete-product', admin, async (req, res) => {
    try {
        const { id } = req.body;
        let product = await Product.findByIdAndDelete(id);
        res.json(product);
    } catch (e) {
        res.status(500).json({ error: e.message });
    }

});
// end here

module.exports = adminRouter;