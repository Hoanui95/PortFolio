# coding:  utf-8
#J'ai choisi cette forme de singleton car on a pas vraiment besoin de rajouter des attributs losque l'on joue a Tankem.

class DTO_Joueur1(object):
    class __InternalDTO_Joueur1(object):
        def __init__(self):
            self.id = 0
            self.nom = "Joueur1"
            self.mdp = ""
            self.phrase = "hi"
            self.experience = 0
            self.vie = 0
            self.force = 0
            self.agilite = 0
            self.dexterite = 0
            self.R = 0.7
            self.G = 0.5
            self.B = 0.5
            self.distance = 0
            self.favori = 1

    __logger_instance = None

    def __new__(cls):
        if not DTO_Joueur1.__logger_instance:
            DTO_Joueur1.__logger_instance = DTO_Joueur1.__InternalDTO_Joueur1()
        return DTO_Joueur1.__logger_instance
