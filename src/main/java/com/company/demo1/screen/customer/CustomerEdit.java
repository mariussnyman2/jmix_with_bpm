package com.company.demo1.screen.customer;

import io.jmix.ui.screen.*;
import com.company.demo1.entity.Customer;

@UiController("d_Customer.edit")
@UiDescriptor("customer-edit.xml")
@EditedEntityContainer("customerDc")
public class CustomerEdit extends StandardEditor<Customer> {
}