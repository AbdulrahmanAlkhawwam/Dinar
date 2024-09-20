import 'package:Dinar/src/core/utils/app_context.dart';
import 'package:Dinar/src/features/payments/domain/entities/payment.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final Payment payment;

  const PaymentItem({
    super.key,
    required this.payment,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: context.colors.onSecondary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: context.colors.onErrorContainer,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      payment.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    payment.description != null
                        ? Text(
                            "description : ${payment.description}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.fade,
                          )
                        : const SizedBox(),
                    Text(
                      "date : ${DateFormat.yMMMMd().format(payment.date)}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      "value : ${payment.value}",
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {}, // we not do delete function yet
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
