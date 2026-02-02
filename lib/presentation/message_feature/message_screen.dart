import 'package:carousel_slider/carousel_slider.dart' as carousel;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  int _current = 0;
  int currentAccount = 0;
  int currentRoadMap = 0;
  int currentAcademy = 0;

  // Dummy data
  final String userName = 'John Doe';
  final String? userPhotoUrl = null;
  final bool hasNotif = false;
  final double flagBalance = 1000.0;
  final String pointReward = '500';

  final List<Map<String, dynamic>> bannerList = [
    {'mobile_url': 'https://via.placeholder.com/400x200'},
    {'mobile_url': 'https://via.placeholder.com/400x200'},
  ];

  final List<Map<String, dynamic>> accountsList = [
    {
      'typeAccount': 'Professional',
      'balance': '35000',
      'server': 'Orbitrade-Live',
      'mt4_id': '22222222',
      'leverage': '200',
      'tipe_deposit': 11,
    },
  ];

  final List<Map<String, dynamic>> categoryList = [
    {'id': 1, 'signalName': 'EUR/USD'},
    {'id': 2, 'signalName': 'GBP/USD'},
  ];

  final List<Map<String, dynamic>> itemList = [
    {
      'signalName': 'EUR/USD',
      'signalLogo': 'logo.png',
      'type': 'Buy',
      'price': '1.0850',
      'stoploss': '1.0800',
      'takeprofit': '1.0900',
      'signal_date': '2024-01-15',
      'status': 'buy limit',
      'base': 'EUR/USD',
    },
  ];

  final List<Map<String, dynamic>> _imageList = [
    {
      'roadmad': 'image1.jpg',
      'created_at': '2024-01-15T10:00:00Z',
    },
  ];

  final List<Map<String, dynamic>> _pdfList = [
    {
      'filepdf': 'plan1.pdf',
      'created_at': '2024-01-15T10:00:00Z',
    },
  ];

  final List<Map<String, dynamic>> _videoList = [
    {
      'videoTitle': 'Trading Basics',
      'uavid': 'video1',
      'videoThumbnail': 'thumb1.jpg',
      'videoPoin': '100',
    },
  ];

  final List<Map<String, dynamic>> _flixList = [
    {
      'videoTitle': 'Forex Tutorial',
      'uavid': 'flix1',
      'videoThumbnail': 'thumb2.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    var bannerWidgets = bannerList.map((banner) {
      return ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Image.network(
          banner['mobile_url'],
          fit: BoxFit.cover,
          width: 1000.0,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: 1000.0,
              height: 200,
              color: Colors.grey[300],
              child: const Icon(Icons.image, size: 50),
            );
          },
        ),
      );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: userPhotoUrl != null && userPhotoUrl!.isNotEmpty
                    ? NetworkImage(userPhotoUrl!)
                    : const AssetImage('assets/ic_logo_app.png')
                        as ImageProvider,
                onBackgroundImageError: (exception, stackTrace) {
                  // Handle error
                },
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome Back',
                    style: TextStyle(color: Colors.grey, fontSize: 11),
                  ),
                  Text(
                    userName,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              hasNotif ? Icons.notifications : Icons.notifications_none,
              color: hasNotif ? Colors.red : Colors.grey,
            ),
            onPressed: () {
              // Placeholder action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: carousel.CarouselSlider(
                      items: bannerWidgets,
                      options: carousel.CarouselOptions(
                        height: 200.0,
                        viewportFraction: 0.8,
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: bannerList.asMap().entries.map((entry) {
                      return Container(
                        width: _current == entry.key ? 30.0 : 8.0,
                        height: 8.0,
                        margin: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        decoration: BoxDecoration(
                          shape: _current == entry.key
                              ? BoxShape.rectangle
                              : BoxShape.circle,
                          borderRadius: _current == entry.key
                              ? BorderRadius.circular(4.0)
                              : null,
                          color: _current == entry.key
                              ? Colors.red
                              : Colors.red.withValues(alpha: 0.3),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Your Account',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 170,
              child: accountsList.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      itemCount: accountsList.length,
                      itemBuilder: (context, index) {
                        final account = accountsList[index];
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: AccountCard(
                            accountType:
                                account['typeAccount']?.toString() ?? '-',
                            balance: _parseNum(account['balance']),
                            server: account['server']?.toString() ??
                                'Orbitrade-Live',
                            login: account['mt4_id']?.toString() ?? '-',
                            leverage: _formatLeverage(account['leverage']),
                            rateType: _mapDepositToRateType(
                                account['tipe_deposit']),
                          ),
                        );
                      },
                    )
                  : const Center(
                      child: Text('No accounts available'),
                    ),
            ),
            const SizedBox(height: 16),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    _PillButton(
                      label: 'Request Akun Real',
                      icon: Icons.add_circle_outline,
                      onTap: () {},
                    ),
                    const SizedBox(width: 12),
                    _PillButton(
                      label: 'Request Akun Demo',
                      icon: Icons.add_circle_outline,
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 170,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _ActionButton(
                          icon: Icons.account_balance,
                          label: 'Deposit',
                          onTap: () {},
                        ),
                        _ActionButton(
                          icon: Icons.money_off,
                          label: 'Withdrawal',
                          onTap: () {},
                        ),
                        _ActionButton(
                          icon: Icons.swap_horiz,
                          label: 'Internal',
                          onTap: () {},
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        height: 50,
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.red[50],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.red,
                            width: 1,
                          ),
                        ),
                        child: InkWell(
                          onTap: () {},
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.shield, color: Colors.red, size: 24),
                              SizedBox(width: 8),
                              Text(
                                'Warranty Form',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                height: 170,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 0,
                      bottom: 0,
                      child: Container(
                        width: 100,
                        color: Colors.grey[200],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Your Point:',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            '$pointReward Points',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {},
                            child: const Text(
                              'How to get more point?',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Redeem Now!',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Signal',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 1.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0),
                      child: ButtonChangeBar(
                        status: currentAccount == 0,
                        name: 'Semua',
                        onClick: () {
                          setState(() {
                            currentAccount = 0;
                          });
                        },
                      ),
                    ),
                    ...List.generate(
                      categoryList.length,
                      (index) {
                        return ButtonChangeBar(
                          status: currentAccount == categoryList[index]['id'],
                          name: '${categoryList[index]['signalName']}',
                          onClick: () {
                            setState(() {
                              currentAccount = categoryList[index]['id'];
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            flagBalance > 99.99
                ? itemList.isNotEmpty
                    ? SizedBox(
                        height: 175,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: itemList.length,
                          itemBuilder: (context, index) {
                            if (currentAccount == 0 ||
                                itemList[index]['signalCategory'] ==
                                    currentAccount) {
                              return SignalCard(
                                signalName: itemList[index]['signalName'],
                                signalLogo: itemList[index]['signalLogo'],
                                type: itemList[index]['type'],
                                price: itemList[index]['price'],
                                stoploss: itemList[index]['stoploss'],
                                takeprofit: itemList[index]['takeprofit'],
                                signalDate: itemList[index]['signal_date'],
                                status: itemList[index]['status'],
                                base: itemList[index]['base'],
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      )
                    : const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SizedBox(
                          height: 50,
                          child: Text('No New Signal'),
                        ),
                      )
                : Container(
                    margin: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Syarat Signal')),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Roadmaps',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  ButtonChangeBar(
                    status: currentRoadMap == 0,
                    name: 'Peta Harga',
                    onClick: () {
                      setState(() {
                        currentRoadMap = 0;
                      });
                    },
                  ),
                  ButtonChangeBar(
                    status: currentRoadMap == 1,
                    name: 'Trading Plan',
                    onClick: () {
                      setState(() {
                        currentRoadMap = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
            flagBalance > 99.99
                ? currentRoadMap == 0
                    ? SizedBox(
                        height: 175,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _imageList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var image = _imageList[index];
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 0, 0),
                                child: Container(
                                  width: 250,
                                  height: 175,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(4, 4, 4, 4),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            height: 120,
                                            color: Colors.grey[300],
                                            child: const Icon(Icons.image,
                                                size: 50),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              _formatCreatedAt(
                                                  image['created_at']),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : SizedBox(
                        height: 175,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _pdfList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var pdf = _pdfList[index];
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 0, 0),
                                child: Container(
                                  width: 250,
                                  height: 175,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(4, 16, 4, 4),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Container(
                                            height: 80,
                                            color: Colors.grey[300],
                                            child: const Icon(Icons.picture_as_pdf,
                                                size: 50),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(8, 8, 8, 8),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                _formatCreatedAt(
                                                    pdf['created_at']),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                : Container(
                    margin: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Syarat Roadmap')),
                  ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Academy',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Lihat Semua',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  ButtonChangeBar(
                    status: currentAcademy == 0,
                    name: 'Mandatory Video',
                    onClick: () {
                      setState(() {
                        currentAcademy = 0;
                      });
                    },
                  ),
                  ButtonChangeBar(
                    status: currentAcademy == 1,
                    name: 'Forexflix',
                    onClick: () {
                      setState(() {
                        currentAcademy = 1;
                      });
                    },
                  ),
                ],
              ),
            ),
            flagBalance > 99.99
                ? currentAcademy == 0
                    ? SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _videoList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var video = _videoList[index];
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 0, 0),
                                child: Container(
                                  width: 250,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Container(
                                          height: 120,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.play_circle,
                                              size: 50),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              video['videoTitle'],
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Poin ${video['videoPoin']}',
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    : SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _flixList.length,
                          itemBuilder: (BuildContext context, int index) {
                            var video = _flixList[index];
                            return InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 16, 0, 0),
                                child: Container(
                                  width: 250,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(8),
                                          topRight: Radius.circular(8),
                                        ),
                                        child: Container(
                                          height: 120,
                                          color: Colors.grey[300],
                                          child: const Icon(Icons.play_circle,
                                              size: 50),
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              video['videoTitle'],
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                fontSize: 12,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                : Container(
                    margin: const EdgeInsets.all(16.0),
                    width: double.infinity,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Center(child: Text('Syarat Academy')),
                  ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: () {},
        child: const Icon(Icons.chat, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  String? _mapDepositToRateType(dynamic tipeDeposit) {
    if (tipeDeposit == null) return null;
    final n = int.tryParse(tipeDeposit.toString());
    if (n == 10) return 'Fixed rate';
    if (n == 11) return 'Floating rate';
    return null;
  }

  num _parseNum(dynamic v) {
    if (v is num) return v;
    if (v is String) {
      final s = v.replaceAll(',', '');
      return num.tryParse(s) ?? 0;
    }
    return 0;
  }

  String _formatLeverage(dynamic lev) {
    if (lev == null) return '1:200';
    if (lev is num) return '1:${lev.toInt()}';
    final s = lev.toString();
    if (s.contains(':')) return s;
    final n = num.tryParse(s);
    return '1:${(n ?? 200).toInt()}';
  }

  String _formatCreatedAt(String createdAt) {
    try {
      DateTime parsedDate = DateTime.parse(createdAt).add(const Duration(hours: 7));
      DateFormat formatter = DateFormat('EEEE dd-MM-yyyy');
      return formatter.format(parsedDate);
    } catch (e) {
      return createdAt;
    }
  }
}

class AccountCard extends StatelessWidget {
  final String accountType;
  final num balance;
  final String server;
  final String login;
  final String leverage;
  final String? rateType;

  const AccountCard({
    super.key,
    required this.accountType,
    required this.balance,
    required this.server,
    required this.login,
    required this.leverage,
    required this.rateType,
  });

  @override
  Widget build(BuildContext context) {
    final nf = NumberFormat.currency(locale: 'en_US', symbol: '\$');
    final showRateChip = (rateType != null && rateType!.trim().isNotEmpty);

    return Container(
      width: 290,
      margin: const EdgeInsets.only(left: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.brown[700],
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: DefaultTextStyle(
        style: const TextStyle(color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  accountType,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    height: 1.1,
                    color: Colors.white,
                  ),
                ),
                if (showRateChip) ...[
                  const SizedBox(width: 6),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      rateType!,
                      style: const TextStyle(
                        color: Color(0xFF8A2B2B),
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _LabelValue(
                  label: 'Saldo',
                  value: nf.format(balance),
                ),
                _LabelValue(
                  label: 'Leverage',
                  value: leverage,
                  alignEnd: true,
                ),
              ],
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _LabelValue(
                  label: 'Server',
                  value: server,
                ),
                _LabelValue(
                  label: 'No. Akun',
                  value: login,
                  alignEnd: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LabelValue extends StatelessWidget {
  final String label;
  final String value;
  final bool alignEnd;

  const _LabelValue({
    required this.label,
    required this.value,
    this.alignEnd = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment:
            alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFFA8A8A8),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              height: 1.2,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
      ),
    );
  }
}

class SignalCard extends StatelessWidget {
  final String signalName;
  final String signalLogo;
  final String type;
  final String price;
  final String stoploss;
  final String takeprofit;
  final String signalDate;
  final String status;
  final String base;

  const SignalCard({
    super.key,
    required this.signalName,
    required this.signalLogo,
    required this.type,
    required this.price,
    required this.stoploss,
    required this.takeprofit,
    required this.signalDate,
    required this.status,
    required this.base,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 16, bottom: 8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withValues(alpha: 0.5),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: _getColorByType(status),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                ),
                child: Text(
                  "$type $base",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 3,
                                    child: Text(
                                      'Entry',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      ': $price',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.purple,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 3,
                                    child: Text(
                                      'SL',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      ': $stoploss',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                children: [
                                  const Expanded(
                                    flex: 3,
                                    child: Text(
                                      'TP',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      ': $takeprofit',
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            if (signalLogo.isNotEmpty)
                              SizedBox(
                                width: 150,
                                height: 90,
                                child: Container(
                                  color: Colors.grey[300],
                                  child: const Icon(Icons.image, size: 50),
                                ),
                              ),
                            const SizedBox(height: 6),
                            Text(
                              signalDate,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getColorByType(String type) {
    switch (type.toLowerCase()) {
      case 'close_win':
        return Colors.green;
      case 'close_lose':
        return Colors.red;
      case 'buy limit':
        return Colors.blue;
      case 'sell limit':
        return Colors.orange;
      default:
        return Colors.blueGrey;
    }
  }
}

class _PillButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _PillButton({
    required this.label,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(28),
      elevation: 1,
      child: InkWell(
        borderRadius: BorderRadius.circular(28),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: const Color(0xFFB00020)),
              const SizedBox(width: 8),
              Text(
                label,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: const Color(0xFF303030),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonChangeBar extends StatelessWidget {
  final bool status;
  final String name;
  final VoidCallback onClick;

  const ButtonChangeBar({
    super.key,
    required this.status,
    required this.name,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Material(
        color: status ? Colors.red : Colors.white,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: onClick,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              name,
              style: TextStyle(
                color: status ? Colors.white : Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 40, color: Colors.black),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
