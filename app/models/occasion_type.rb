class OccasionType < CustomerData
  using_access_control
  has_many :occasions
    
  validates_presence_of     :name
  validates_presence_of     :visibility
  
  STANDARD_TYPES = ["Aikuistenkerhot",
                    "Juhlat",
                    "Julkaisutilaisuus",
                    "Kodinilta",
                    "Kokous",
                    "Kristillisyyden työn koulutustilaisuus",
                    "Lauluilta",
                    "Leirityötilaisuus",
                    "Lähetysseurat Ry",
                    "Lähetysseurat SRK",
                    "Lähetystoimikunta",
                    "Muu varaus (häät jne.)",
                    "Nuortenilta/nuorisopäivät",
                    "Opistotyötilaisuus",
                    "Pyhäkoulu",
                    "Päiväkerho",
                    "Raamattuluokka",
                    "Retki/leiri",
                    "Seurakuntapäivät/ilta",
                    "Seurat",
                    "Varainhankintatapahtuma",
                    "Vierailevat myyjäiset"].sort
  
  def getOptionsForSelectList(method)
   case method
     when :visibility
       @options = {
         'Sisäinen (intranet)' => 10,
         'Julkinen (internet)' => 20,
       }
   end
  end

  def public_visible?
    visibility == 20
  end
end
