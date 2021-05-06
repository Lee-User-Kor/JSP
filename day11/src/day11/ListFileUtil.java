package day11;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class ListFileUtil {
        // 파일 관련된 모든 내용은 여기서 처리하기
        private String path = "D:\\오후취업반 이재호\\3.UI구현(JSP)\\workspace-jsp\\day11";
        private ArrayList<VO> dataList;
        private File f = new File(path, "test2.txt");
        
        private void save() throws IOException {
                if(f.exists() == false) {
                        f.createNewFile();
                }
                FileOutputStream fos = new FileOutputStream(f);
                ObjectOutputStream oos = new ObjectOutputStream(fos);
                oos.writeObject(dataList);
                oos.close();
                fos.close();
        }
        
        public void addData(VO vo) throws IOException {
                vo.setDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
                dataList.add(vo);
                save();
        }
        
        public ArrayList<VO> getDataList() throws IOException, ClassNotFoundException {
                if(f.exists() == false) {
                        dataList = new ArrayList<VO>();
                }
                else {
                        FileInputStream fis = new FileInputStream(f);
                        ObjectInputStream ois = new ObjectInputStream(fis);
                        dataList = (ArrayList<VO>)ois.readObject();
                        ois.close();
                        fis.close();
                }
                return dataList;
        }
        
        // 만약 파일이 없으면 비어있는 ArrayList 를 생성하여 파일로 기록해두기
        // 파일이 있으면 파일에서 불러와서, 리스트를 반환하는 메서드
        // 파일이 있으면 전달받은 리스트를 파일에 반영하는 메서드
}
