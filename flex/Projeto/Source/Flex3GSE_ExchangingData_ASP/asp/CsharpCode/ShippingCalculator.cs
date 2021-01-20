using System;
using System.Collections;

namespace quickstart
{

    public class ShippingCalculator
    {
        //Returns a list of made-up ShippingOptions.
        public ArrayList getShippingOptions(int zipcode, double pounds)
        {
            ArrayList options = new ArrayList();
            double baseCost;
            
            baseCost = Math.Round((double)zipcode / 10000) + (pounds * 5);
            options.Add(new ShippingOption("Next Day", baseCost * 4));
            options.Add(new ShippingOption("Two Day Air", baseCost * 2));
            options.Add(new ShippingOption("Saver Ground", baseCost));

            return options;
        }
    }
}