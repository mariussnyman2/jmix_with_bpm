package com.company.demo1.screen.customer;

import io.jmix.ui.screen.*;
import com.company.demo1.entity.Customer;

@UiController("d_Customer.browse")
@UiDescriptor("customer-browse.xml")
@LookupComponent("customersTable")
public class CustomerBrowse extends StandardLookup<Customer> {
}