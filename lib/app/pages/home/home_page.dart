import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:money_formatter/money_formatter.dart';
import 'package:tpsgetx3/app/controllers/theme_controller.dart';
import 'package:tpsgetx3/app/pages/sidemenu/sidemenu_page.dart';
import 'package:tpsgetx3/app/pages/widgets/loading_widget.dart';

import 'home_controller.dart';

class HomePage extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    //Get other depended controllers
    var themeCtrl = Get.find<ThemeController>();
    var myanmarCurrencyController = TextEditingController();

    return Scaffold(
      drawer: appDrawer(),
      appBar: AppBar(
        actions: [
          Obx(() {
            return IconButton(
              icon: Icon(
                controller.searchMode ? Icons.search : Icons.search,
                color: controller.searchMode
                    ? Colors.white
                    : themeCtrl.activeTheme.iconTheme.color,
              ),
              onPressed: () {
                controller.changeSearchMode();
              },
            );
          })
        ],
      ),
      body: SafeArea(
        child: GetX<HomeController>(
          initState: (state) {},
          builder: (controller) {
            List<String> exchangeCurrencyRates =
                controller.rate?.rates.keys.toList() ?? [];

            return controller.isLoading
                ? LoadingWidget()
                : (controller.rate != null)
                    ? Center(
                        child: RefreshIndicator(
                          triggerMode: RefreshIndicatorTriggerMode.anywhere,
                          onRefresh: () async =>
                              controller.updateExchangeRates(),
                          child: ListView(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  Text(controller.updateRatesStatus),
                                  const SizedBox(height: 100),
                                  Text('🏦${controller.rate!.info!}🏦'),
                                  const SizedBox(height: 20),
                                  Text(
                                    '💵1 ${controller.exchangeCurrency} = ${controller.rate?.rates["${controller.exchangeCurrency}"]} MMK💵',
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  const Divider(
                                    height: 5,
                                    color: Colors.blue,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    '${MoneyFormatter(amount: controller.myanmarCurrencyAmount).output.nonSymbol} MMK = ${MoneyFormatter(amount: controller.exchangeCurrencyAmount).output.nonSymbol} ${controller.exchangeCurrency}',
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  DropdownButton<String>(
                                    // Step 3.
                                    value: controller.exchangeCurrency,
                                    // Step 4.
                                    items: exchangeCurrencyRates
                                        .map<DropdownMenuItem<String>>(
                                      (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style:
                                                const TextStyle(fontSize: 20),
                                          ),
                                        );
                                      },
                                    ).toList(),
                                    // Step 5.
                                    onChanged: (String? newValue) {
                                      controller
                                          .changeExchangeCurrency(newValue!);
                                      controller.exchange(
                                          controller.myanmarCurrencyAmount);
                                    },
                                  ),
                                  const SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 80.0),
                                    child: TextField(
                                      controller: myanmarCurrencyController,
                                      keyboardType: TextInputType.number,
                                      style: const TextStyle(
                                        fontSize: 20,
                                      ),
                                      decoration: const InputDecoration(
                                        hintText: 'Enter Amount (Kyats)',
                                        hintStyle: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  ElevatedButton(
                                    onPressed: () {
                                      final myanmarCurrencyAmount =
                                          double.tryParse(
                                              myanmarCurrencyController.text)!;
                                      controller
                                          .exchange(myanmarCurrencyAmount);
                                    },
                                    child: const Text('Exchange Now'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    : const Center(
                        child: Text(
                          'Oops!\nPlease check internet connection.',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
          },
        ),
      ),
    );
  }

  Widget appDrawer() {
    return SideMenuPage();
  }
}
