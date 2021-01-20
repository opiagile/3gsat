using System;

namespace quickstart
{
    public class ShippingOption
    {
        private String service;
        private double price;

        public ShippingOption()
        {
        }

        public ShippingOption(String aService, double aPrice)
        {
            this.service = aService;
            this.price = aPrice;
        }

        public void setService(String value)
        {
            this.service = value;
        }

        public void setPrice(double value)
        {
            this.price = value;
        }

        public String getService() { return this.service; }

        public double getPrice() { return this.price; }
    }
}