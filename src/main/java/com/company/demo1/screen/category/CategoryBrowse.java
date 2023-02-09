package com.company.demo1.screen.category;

import io.jmix.ui.screen.*;
import com.company.demo1.entity.Category;

@UiController("d_Category.browse")
@UiDescriptor("category-browse.xml")
@LookupComponent("table")
public class CategoryBrowse extends MasterDetailScreen<Category> {
}