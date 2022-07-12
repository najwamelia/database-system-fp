-- Menampilkan Semua Data pada Setiap Tabel
SELECT * FROM `branch_store`
SELECT * FROM `buyer`
SELECT * FROM `distribution`
SELECT * FROM `goods`
SELECT * FROM `job`
SELECT * FROM `order`
SELECT * FROM `order_bs`
SELECT * FROM `payment_goods`
SELECT * FROM `procurement`
SELECT * FROM `suppliers`
SELECT * FROM `worker`

-- Total Penjualan Order BS
SELECT SUM(BSORDER_AMOUNT) from ORDER_BS;

-- Total Penjualan Order HQ
SELECT SUM(ORDER_TOTAL) FROM ORDER;

-- Total Penjualan Order BS pada Bulan Oktober
SELECT SUM(BSORDER_TOTAL) FROM ORDER_BS WHERE BSORDER_DATE >= '1/10/2021' AND BSORDER_DATE <= '31/10/2021';

-- Total Penjualan Order HQ pada Bulan Oktober
SELECT SUM(ORDER_TOTAL) FROM ORDER WHERE ORDER_DATE >= '1/10/2021' AND BSORDER_DATE <= '31/10/2021';

-- Distribusi pada Bulan Oktober yang sedang dalam pengiriman
SELECT * FROM DISTRIBUTION WHERE DISTRI_DATE >= '1/10/2021' AND DISTRI_DATE <= '31/10/2021';

-- Mengubah Status Distribusi yang memiliki ID 1 menjadi "Accept"
UPDATE TABLE DISTRIBUTION
SET DISTRI_STATUS = 'Accept' WHERE DISTRI_ID = 1;

-- Procurement pada Bulan Desember
SELECT * FROM PROCUREMENT WHERE PROC_DATE >= '1/12/2021' AND PROC_DATE <= '31/10/2021';

-- Menampilkan Nama Pegawai yang bertanggungjawab di order
SELECT `order`.order_id, `order`.worker_id, worker.worker_fname, worker.worker_lname, `order`.byr_id, `order`.goods_id, `order`.order_date, `order`.order_amount, `order`.order_total FROM `order`
INNER JOIN worker ON `order`.worker_id = worker.worker_id;

-- Menampilkan Nama Pegawai yang bertanggungjawab di order bs
SELECT order_bs.bsorder_id, order_bs.worker_id, worker.worker_fname, worker.worker_lname, order_bs.bs_id, order_bs.goods_id, order_bs.bsorder_date, order_bs.bsorder_amount, order_bs.bsorder_total FROM order_bs
INNER JOIN worker ON order_bs.worker_id = worker.worker_id;

