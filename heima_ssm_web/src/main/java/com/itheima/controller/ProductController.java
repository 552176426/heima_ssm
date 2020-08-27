package com.itheima.controller;

import com.github.pagehelper.PageInfo;
import com.itheima.dao.OrdersDao;
import com.itheima.domain.Product;
import com.itheima.service.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private ProductService productService;

    @Autowired
    private OrdersDao ordersDao;

    @RequestMapping("/findAll.do")
    /*@RolesAllowed({"ROLE_ADMIN"})*/
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page, @RequestParam(name = "size",required = true,defaultValue = "4")Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<Product> productList = productService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(productList);
        mv.addObject("pageInfo",pageInfo);
        mv.setViewName("product-page-list");
        return mv;
    }

    @RequestMapping("/save.do")
    public String save(Product product) throws Exception {
        productService.save(product);
        return "redirect:findAll.do";
    }

    @RequestMapping("/edit.do")
    public ModelAndView edit(@RequestParam(name = "id") Integer id) throws Exception {
        Product product = productService.findById(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("product",product);
        mv.setViewName("product-edit");
        return mv;
    }

    @RequestMapping("/edit_submit.do")
    public String editSubmit(@RequestParam(name = "id") Integer id,Product product) throws Exception {
        product.setId(id);
        productService.updateProduct(product);
        return "redirect:findAll.do";
    }

    @RequestMapping("delete.do")
    public String del(@RequestParam(name = "ids") int[] ids){
        System.out.println(Arrays.toString(ids));
        for (int id : ids) {
            ordersDao.deleteByProductId(id);
            productService.delete(id);
        }
        return "redirect:findAll.do";
    }


}
