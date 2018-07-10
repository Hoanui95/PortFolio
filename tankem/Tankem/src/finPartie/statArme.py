
class StatArme(object):
    def __init__(self, nomArme):
        self.nomArme = nomArme
        self.totalCoup = 0
        self.coupRecu = 0
        self.coupAtteint = 0
    
    def incrementeTotalCoup(self):
        self.totalCoup += 1

    def incrementeCoupRecu(self):
        self.coupRecu += 1
    
    def incrementeCoupAtteint(self):
        self.coupAtteint += 1