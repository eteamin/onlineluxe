from datetime import datetime
from threading import Thread

from tg import config
from telegram import Bot


class TelegramNotifier(object):
    def __init__(self, purchase, final_price):
        self.token = config.get('telegram.bot.token')
        self.chat_id = config.get('telegram.chat.id')
        self.bot = Bot(token=self.token)
        self.purchase = purchase
        self.final_price = final_price
        self.message = self._make_message()
        self.notifier = Thread(target=self._notify, daemon=True)
        self.notifier.start()

    def _notify(self):
        self.bot.send_message(self.chat_id, text=self.message)

    def _make_message(self):
        return '{}\n{}\n{}'.format([p.names for p in self.purchase.product], datetime.now(), self.final_price)
