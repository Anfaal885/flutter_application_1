class DashboardStat {
  final String title;
  final String value;
  final String subtitle;
  final String icon;

  const DashboardStat({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
  });
}

class Order {
  final String orderNumber;
  final String customerName;
  final String product;
  final String date;
  final String amount;
  final String status;

  const Order({
    required this.orderNumber,
    required this.customerName,
    required this.product,
    required this.date,
    required this.amount,
    required this.status,
  });
}

const dashboardStats = [
  DashboardStat(
    title: 'Total Users',
    value: '12,480',
    subtitle: '+8.2% this month',
    icon: 'people',
  ),
  DashboardStat(
    title: 'Orders',
    value: '1,284',
    subtitle: '+12.5% this month',
    icon: 'orders',
  ),
  DashboardStat(
    title: 'Revenue',
    value: '\$48,920',
    subtitle: '+6.4% this month',
    icon: 'revenue',
  ),
  DashboardStat(
    title: 'Products',
    value: '356',
    subtitle: '24 new products',
    icon: 'products',
  ),
];

const recentOrders = [
  Order(
    orderNumber: '#1001',
    customerName: 'John Smith',
    product: 'Premium Headphones',
    date: '02 Sep 2026',
    amount: '\$120',
    status: 'Completed',
  ),
  Order(
    orderNumber: '#1002',
    customerName: 'Ali Hassan',
    product: 'Wireless Keyboard',
    date: '02 Sep 2026',
    amount: '\$250',
    status: 'Processing',
  ),
  Order(
    orderNumber: '#1003',
    customerName: 'Sarah Khan',
    product: 'Smart Watch',
    date: '01 Sep 2026',
    amount: '\$180',
    status: 'Completed',
  ),
  Order(
    orderNumber: '#1004',
    customerName: 'Usman Ahmed',
    product: 'Laptop Stand',
    date: '01 Sep 2026',
    amount: '\$95',
    status: 'Pending',
  ),
  Order(
    orderNumber: '#1005',
    customerName: 'Emma Wilson',
    product: 'USB-C Hub',
    date: '31 Aug 2026',
    amount: '\$75',
    status: 'Completed',
  ),
];