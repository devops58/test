using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace _1Web
{
    public partial class _3 : System.Web.UI.Page
    {
        private static _3 instance = null;

        private _3()
        {
        }

        public static _3 getInstance()
        {
            if (instance == null)
            {
                instance = new _3();
            }
            return instance;
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            int müşteriNumarası = 15000000;

            ÇalıştırmaMotoru.KomutÇalıştır("MuhasebeModulu", "MaaşYatır", new object[] { müşteriNumarası });

            ÇalıştırmaMotoru.KomutÇalıştır("MuhasebeModulu", "YıllıkÜcretTahsilEt", new object[] { müşteriNumarası });

            ÇalıştırmaMotoru.BekleyenİşlemleriGerçekleştir();
        }
        public class ÇalıştırmaMotoru
        {

            public static object[] KomutÇalıştır(string modülSınıfAdı, string methodAdı, object[] inputs)
            {
                _3 fx = _3.getInstance();

                throw new NotImplementedException();
            }

            public static void BekleyenİşlemleriGerçekleştir()
            {
                if (instance == null)
                {
                    //Veritabanıİşlemleri();
                }
            }
        }

        public class MuhasebeModülü
        {
            private void MaaşYatır(int müşteriNumarası)
            {
                // gerekli işlemler gerçekleştirilir.
                Console.WriteLine(string.Format("{0} numaralı müşterinin maaşı yatırıldı.", müşteriNumarası));
            }

            private void YıllıkÜcretTahsilEt(int müşteriNumarası)
            {
                // gerekli işlemler gerçekleştirilir.
                Console.WriteLine("{0} numaralı müşteriden yıllık kart ücreti tahsil edildi.", müşteriNumarası);
            }

            private void OtomatikÖdemeleriGerçekleştir(int müşteriNumarası)
            {
                // gerekli işlemler gerçekleştirilir.
                Console.WriteLine("{0} numaralı müşterinin otomatik ödemeleri gerçekleştirildi.", müşteriNumarası);
            }
        }

        public class Veritabanıİşlemleri
        {

        }
    }
}