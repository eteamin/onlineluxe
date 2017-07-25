from tg import config
from suds.client import Client


class ZarinpalClient:
    def __init__(self, amount, basket_uid, email=None, mobile=None):
        self.merchant_id = config.get('merchant_id')
        self.amount = int(amount)
        self.email = email
        self.mobile = mobile
        self.basket_uid = basket_uid
        self.description = self._make_description()
        self.callback_url = '{}/purchase_callback'.format(config.get('base_url'))
        self.zarinpal_request_url = config.get('webgate')
        self.client = Client(self.zarinpal_request_url)

    def make(self):
        resp = self.client.service.PaymentRequest(
            self.merchant_id,
            self.amount,
            self.description,
            self.email,
            self.mobile,
            self.callback_url
        )
        return resp.Authority if resp.Status == 100 else None

    def verify_payment(self, authority):
        resp = self.client.service.PaymentVerification(
            self.merchant_id,
            authority,
            self.amount
        )
        return (resp.RefID, None) if resp.Status == 100 else (None, resp.Status)

    def _make_description(self):
        return u'پرداخت مبلغ {} تومان برای فاکتور شماره {} سایت آنلاین لوکس'.format(self.amount, self.basket_uid)
