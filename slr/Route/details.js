const express = require("express");
const router = express.Router();
const pool = require("../pool.js");
router.get('/pro', (req, res) => {
  // 页数
  let page = req.query.page;
  // 每页商品的数量
  let pageSize = 12;
  // 开始查询的值
  let start = (page - 1) * pageSize;
  // console.log(req.query.kw)
  // 判断是否请求是否包含参数 是-->false   否-->true
  if (req.query.kw === undefined) {
    let sql = `SELECT COUNT(pid) AS count FROM slr_product`;
    pool.query(sql, (err, s) => {
      if (err) throw err;
      // 商品总数据
      let count = s[0].count;
      // 商品页数
      let totalpage = Math.ceil(s[0].count / pageSize);
      sql = `SELECT pid,brand,pname,price,discount,idx_img FROM slr_product limit ${start},${pageSize}`
      pool.query(sql, (err, result) => {
        if (err) throw err;
        res.send({
          "code": 1,
          totalpage,
          count,
          result
        });
      });
    })
  } else if (page === undefined) {
    let kw = req.query.kw;
    sql = `SELECT pid, pname FROM slr_product WHERE pname LIKE '%${kw}%' limit 0,4`;
    pool.query(sql, (err, result) => {
      if (err) throw err;
      res.send(result);
    });
  } else {
    let kw = req.query.kw;
    // 模糊查找数据总数
    let sql = `
                SELECT COUNT(pid) AS count FROM slr_product WHERE pname LIKE '%${kw}%'
                `;
    pool.query(sql, (err, s) => {
      if (err) throw err;
      // 商品总数据
      let count = s[0].count;
      // 商品的总页数 
      let totalpage = Math.ceil(s[0].count / pageSize);
      sql = `SELECT pid, brand, pname, price, discount, idx_img FROM slr_product WHERE pname LIKE '%${kw}%' limit ${start}, ${pageSize}`;
      pool.query(sql, (error, result) => {
        if (error) throw err;
        res.send({
          "code": 1,
          totalpage,
          count,
          result
        });
      })
    })
  }
});

router.get('/del', (req, res) => {
  let pid = req.query.pid;
  let color = req.query.color;
  // 外键查询
  console.log(color, 1);
  if (color == undefined) {
    let sql = `SELECT * FROM slr_product WHERE pid=${pid}`;
    pool.query(sql, (err, result) => {
      if (err) throw err;
      res.send(result);
    });
  }
  else if(color==""){
    let sql = `SELECT * FROM slr_product_img WHERE pro_id=${pid}`;
    pool.query(sql, (err, result) => {
      if (err) throw err;
      res.send(result);
    });
  }else {
    let sql = `SELECT * FROM slr_product_img WHERE pro_id=${pid} and color='${color}'`;
    pool.query(sql, (err, result) => {
      if (err) throw err;
      res.send(result);
    });
  }
});




module.exports = router;